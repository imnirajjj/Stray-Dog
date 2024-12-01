import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/feature/common/data/model/adoption_request/adoption_request.dart';
import 'package:stray_dog_adoption/feature/common/data/model/dog/dog.dart';
import 'package:stray_dog_adoption/feature/common/data/model/notification/notification.dart';
import 'package:stray_dog_adoption/feature/common/presentation/screen/adoption_detail_screen/adoption_detail_screen.dart';
import 'package:uuid/uuid.dart';

part 'adopt_state.dart';
part 'adopt_cubit.freezed.dart';

@LazySingleton()
class AdoptCubit extends Cubit<AdoptState> {
  AdoptCubit() : super(const AdoptState());

  Future<void> adopt({
    required String dogId,
    required String uid,
  }) async {
    try {
      emit(state.copyWith(loading: true));
      final dogRaw = (await FirebaseFirestore.instance
              .collection(AppCollection.dog)
              .where('dogId', isEqualTo: dogId)
              .get())
          .docs
          .firstOrNull;
      final dogData = dogRaw?.data();
      if (dogData != null) {
        var dog = Dog.fromJson(dogData);
        if (!dog.adoptionRequestUid.contains(uid)) {
          dog = dog.copyWith(
            adoptionRequestUid: [
              ...dog.adoptionRequestUid,
              uid,
            ],
            rejectedUid: dog.rejectedUid.where((e) {
              return e != uid;
            }).toList(),
            acceptedUid: dog.acceptedUid.where((e) {
              return e != uid;
            }).toList(),
          );
          await dogRaw?.reference.set(dog.toJson());
          await FirebaseFirestore.instance
              .collection(AppCollection.adoption)
              .add(
                AdoptionRequest(
                  requestUserEmail:
                      FirebaseAuth.instance.currentUser?.email ?? '',
                  adoptionId: const Uuid().v4(),
                  ownerUserId: dog.uid ?? '',
                  userId: uid,
                  dogId: dogId,
                  organizationDecision: const Decision(
                    status: AppDecision.pending,
                    reason: '',
                  ),
                ).toJson(),
              );
        }
      }
      emit(state.copyWith(loading: false));
    } catch (e) {
      if (e is FirebaseAuthException) {
        await Fluttertoast.showToast(msg: e.message ?? '');
      }
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> cancle({
    required String dogId,
    required String uid,
  }) async {
    try {
      emit(state.copyWith(loading: true));
      final dogRaw = (await FirebaseFirestore.instance
              .collection(AppCollection.dog)
              .where('dogId', isEqualTo: dogId)
              .get())
          .docs
          .firstOrNull;
      final dogData = dogRaw?.data();
      if (dogData != null) {
        var dog = Dog.fromJson(dogData);
        if (dog.adoptionRequestUid.contains(uid)) {
          dog = dog.copyWith(
            adoptionRequestUid: [
              ...dog.adoptionRequestUid,
            ].where((e) => e != uid).toList(),
          );
          await dogRaw?.reference.set(dog.toJson());
          await FirebaseFirestore.instance
              .collection(
                AppCollection.adoption,
              )
              .where('dogId', isEqualTo: dogId)
              .where('userId', isEqualTo: uid)
              .get()
              .then((value) {
            // ignore: avoid_function_literals_in_foreach_calls
            value.docs.forEach((x) async {
              await x.reference.delete();
            });
          });
        }
      }
      await Fluttertoast.showToast(msg: 'Adoption succssfully cancelled');
      emit(state.copyWith(loading: false));
    } catch (e) {
      if (e is FirebaseAuthException) {
        await Fluttertoast.showToast(msg: e.message ?? '');
      }
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> reason({
    required String adoptedUid,
    required String adoptionId,
    required AdoptionDetailScreenEnum enums,
    required String status,
    required String reason,
    required void Function(AdoptionRequest) onSuccess,
  }) async {    
    try {
      emit(state.copyWith(loading: true));
      final collection = FirebaseFirestore.instance.collection(
        AppCollection.adoption,
      );
      final adoptionDoc =
          (await collection.where('adoptionId', isEqualTo: adoptionId).get())
              .docs
              .firstOrNull;
      final adoptionRaw = adoptionDoc?.data();
      final adoptionRef = adoptionDoc?.reference;
      if (adoptionRaw != null) {
        var adoption = AdoptionRequest.fromJson(adoptionRaw);
        if (enums == AdoptionDetailScreenEnum.organizatin) {
          adoption = adoption.copyWith(
            organizationDecision: Decision(status: status, reason: reason),
          );
        }
        await adoptionRef?.set(adoption.toJson());
        onSuccess(adoption);
        if (status == AppDecision.approved || status == AppDecision.rejected) {
          final dogDocs = FirebaseFirestore.instance
              .collection(AppCollection.dog)
              .where('dogId', isEqualTo: adoption.dogId);
          final dogRawDocs = (await dogDocs.get()).docs.firstOrNull;
          final dogRaw = dogRawDocs?.data();
          if (dogRaw != null) {
            var dog = Dog.fromJson(dogRaw);
            dog = dog.copyWith(
              adoptionRequestUid: dog.adoptionRequestUid.where((e) {
                return e != adoptedUid;
              }).toList(),
              rejectedUid: status == AppDecision.rejected
                  ? [
                      ...dog.rejectedUid.where((e) {
                        return e != adoptedUid;
                      }),
                      adoptedUid,
                    ]
                  : dog.rejectedUid.where((e) {
                      return e != adoptedUid;
                    }).toList(),
              acceptedUid: status == AppDecision.approved
                  ? [
                      ...dog.acceptedUid.where((e) {
                        return e != adoptedUid;
                      }),
                      adoptedUid,
                    ]
                  : dog.acceptedUid.where((e) {
                      return e != adoptedUid;
                    }).toList(),
            );
            await dogRawDocs?.reference.set(dog.toJson());
          }

          await FirebaseFirestore.instance
              .collection(AppCollection.notification)
              .add(
                Notification(
                  notificationId: const Uuid().v1(),
                  userId: adoption.userId,
                  adoptionRequest: adoption,
                  timestamp: FieldValue.serverTimestamp(),
                ).toJson(),
              );
        }
      }
      emit(state.copyWith(loading: false));
    } catch (e) {
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> getAdoptionDetail({
    required String dogId,
    required String uid,
    required void Function(AdoptionRequest) onSuccess,
  }) async {
    try {
      emit(state.copyWith(loading: true));
      final collection = FirebaseFirestore.instance.collection(
        AppCollection.adoption,
      );
      final adoptionDoc = (await collection
              .where('userId', isEqualTo: uid)
              .where('dogId', isEqualTo: dogId)
              .get())
          .docs
          .firstOrNull;
      final adoptionRaw = adoptionDoc?.data();
      if (adoptionRaw != null) {
        final adoption = AdoptionRequest.fromJson(adoptionRaw);
        onSuccess(adoption);
      }
      emit(state.copyWith(loading: false));
    } catch (e) {
      emit(state.copyWith(loading: false));
    }
  }
}
