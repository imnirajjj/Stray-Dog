import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/feature/common/data/model/user/user.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

@LazySingleton()
class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState());

  Future<void> updateUser({
    required UserDetail user,
    required File userPhotoFile,
    required void Function() onSuccess,
  }) async {
    try {
      emit(state.copyWith(loading: true));
      final storage = FirebaseStorage.instance;
      final storageRef = storage.ref();
      final reference = storageRef.child(path.basename(userPhotoFile.path));
      final userPhoto = await reference.putFile(userPhotoFile);
      final store = FirebaseFirestore.instance;
      await store.collection(AppCollection.user).doc(user.userDetailId).set(
            user
                .copyWith(
                  photoUrl: await userPhoto.ref.getDownloadURL(),
                )
                .toJson(),
          );
      emit(state.copyWith(loading: false));
      onSuccess();
    } catch (e) {
      if (e is FirebaseException) {
        await Fluttertoast.showToast(msg: e.message ?? '');
      }
      emit(state.copyWith(loading: false));
    }
  }
}
