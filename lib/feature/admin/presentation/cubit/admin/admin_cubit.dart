import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/data/constant/user_type.dart';
import 'package:stray_dog_adoption/feature/common/data/model/user/user.dart';

part 'admin_state.dart';
part 'admin_cubit.freezed.dart';

@LazySingleton()
class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(const AdminState());

  Future<void> init({
    required void Function() onLogout,
    required void Function() onSuccess,
  }) async {
    try {
      final db = FirebaseFirestore.instance;
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        onLogout();
        return;
      }
      final snapshot =
          await db.collection(AppCollection.user).doc(user.uid).get();
      final data = snapshot.data();
      if (data == null) {
        onLogout();
        return;
      }
      final userDetail = UserDetail.fromJson(data);
      emit(state.copyWith(userDetail: userDetail));
      if (userDetail.type != UserType.admin) {
        onLogout();
        return;
      }
      onSuccess();
    } catch (e) {
      onLogout();
    }
  }
}
