import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/feature/common/data/model/adoption_request/adoption_request.dart';
import 'package:stray_dog_adoption/feature/common/data/model/notification/notification.dart';
import 'package:uuid/uuid.dart';

part 'doctor_request_state.dart';
part 'doctor_request_cubit.freezed.dart';

@LazySingleton()
class DoctorRequestCubit extends Cubit<DoctorRequestState> {
  DoctorRequestCubit() : super(const DoctorRequestState());

  Future<void> request({
    required String doctorId,
    required void Function() alreadyExistsCallback,
  }) async {
    try {
      emit(state.copyWith(loading: true));
      final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      final requestUserEmail = FirebaseAuth.instance.currentUser?.email ?? '';
      final collection =
          FirebaseFirestore.instance.collection(AppCollection.doctor);
      final alreadyExists = (await collection
              .where('requestUserId', isEqualTo: userId)
              .where('doctorId', isEqualTo: doctorId)
              .get())
          .docs
          .isNotEmpty;
      if (alreadyExists) {
        alreadyExistsCallback();
      } else {
        await collection.add(
          DoctorRequest(
            doctorRequestId: const Uuid().v4(),
            requestUserEmail: requestUserEmail,
            requestUserId: userId,
            doctorId: doctorId,
            doctorDecision: const Decision(
              status: AppDecision.pending,
              reason: '',
            ),
          ).toJson(),
        );
      }
      emit(state.copyWith(loading: false));
    } catch (e) {
      if (e is FirebaseAuthException) {
        await Fluttertoast.showToast(msg: e.message ?? '');
      }
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> cancel({
    required String doctorRequestId,
  }) async {
    try {
      emit(state.copyWith(loading: true));
      final collection =
          FirebaseFirestore.instance.collection(AppCollection.doctor);
      final raw = (await collection
              .where('doctorRequestId', isEqualTo: doctorRequestId)
              .get())
          .docs;
      for (final data in raw) {
        await data.reference.delete();
      }
      emit(state.copyWith(loading: false));
    } catch (e) {
      if (e is FirebaseAuthException) {
        await Fluttertoast.showToast(msg: e.message ?? '');
      }
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> decision({
    required String doctorRequestId,
    required String status,
    required String reason,
    required void Function(DoctorRequest) onSuccess,
  }) async {
    try {
      emit(state.copyWith(loading: true));
      final collection =
          FirebaseFirestore.instance.collection(AppCollection.doctor);
      final raw = (await collection
              .where('doctorRequestId', isEqualTo: doctorRequestId)
              .get())
          .docs;
      final temp = (await raw.firstOrNull?.reference.get())?.data();
      if (temp != null) {
        var request = DoctorRequest.fromJson(temp);
        request = request.copyWith(
          doctorDecision: Decision(status: status, reason: reason),
        );
        await raw.firstOrNull?.reference.set(request.toJson());
        onSuccess(request);
        if (status == AppDecision.approved || status == AppDecision.rejected) {
          await FirebaseFirestore.instance
              .collection(AppCollection.notification)
              .add(
                Notification(
                  notificationId: const Uuid().v1(),
                  userId: request.requestUserId,
                  doctorRequest: request,
                  timestamp: FieldValue.serverTimestamp(),
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
}
