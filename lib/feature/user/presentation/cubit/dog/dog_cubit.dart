import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/feature/common/data/model/dog/dog.dart';

part 'dog_state.dart';
part 'dog_cubit.freezed.dart';

@LazySingleton()
class DogCubit extends Cubit<DogState> {
  DogCubit() : super(const DogState());

  Future<void> upsert({
    required Dog dog,
    required File? userPhotoFile,
    required void Function() onSuccess,
    String? dogId,
  }) async {    
    try {      
      emit(state.copyWith(loading: true));
      final storage = FirebaseStorage.instance;
      final storageRef = storage.ref();
      String? photoUrl;
      if (userPhotoFile != null) {
        final reference = storageRef.child(path.basename(userPhotoFile.path));
        final userPhoto = await reference.putFile(userPhotoFile);
        photoUrl = await userPhoto.ref.getDownloadURL();
      }
      final store = FirebaseFirestore.instance;
      await store.collection(AppCollection.dog).doc(dogId).set(
            photoUrl != null
                ? dog.copyWith(photoUrl: photoUrl).toJson()
                : dog.toJson(),
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
