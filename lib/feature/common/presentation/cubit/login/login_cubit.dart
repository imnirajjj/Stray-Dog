import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stray_dog_adoption/data/constant/app_key.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@LazySingleton()
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._pref,
  ) : super(const LoginState());

  final SharedPreferences _pref;

  Future<void> setUser(
    String userType,
    User user,
  ) async {
    emit(state.copyWith(userType: userType, user: user));
  }

  Future<void> login(String userType, String email, String password) async {
    try {
      await _pref.setString(AppKey.userType, userType);
      emit(state.copyWith(loading: true));
      final fbAuth = FirebaseAuth.instance;
      final userCredentials = await fbAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredentials.user;
      if (user?.emailVerified == false) {
        await user?.sendEmailVerification();
        await Fluttertoast.showToast(
          msg: 'Successfully sent verification code',
        );
      }
      emit(state.copyWith(loading: false, user: user));
    } catch (e) {
      if (e is FirebaseAuthException) {
        await Fluttertoast.showToast(msg: e.message ?? '');
      }
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> register(
    String userType,
    String email,
    String password,
    void Function() onSuccess,
  ) async {
    try {
      await _pref.setString(AppKey.userType, userType);
      emit(state.copyWith(loading: true));
      final fbAuth = FirebaseAuth.instance;
      final userCredentials = await fbAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredentials.user;
      if (user?.emailVerified == false) {
        await user?.sendEmailVerification();
        await Fluttertoast.showToast(
          msg: 'Successfully sent verification code',
        );
      }
      emit(state.copyWith(loading: false, user: user));
      onSuccess();
    } catch (e) {
      if (e is FirebaseAuthException) {
        await Fluttertoast.showToast(msg: e.message ?? '');
      }
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> logout() async {
    try {
      emit(state.copyWith(loading: true));
      final fbAuth = FirebaseAuth.instance;
      await fbAuth.signOut();
      emit(state.copyWith(loading: false, user: null));
    } catch (e) {
      if (e is FirebaseAuthException) {
        await Fluttertoast.showToast(msg: e.message ?? '');
      }
      emit(state.copyWith(loading: false));
    }
  }
}
