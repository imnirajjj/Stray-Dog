import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stray_dog_adoption/core/di/injection.dart';
import 'package:stray_dog_adoption/core/router/app_router.gr.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';
import 'package:stray_dog_adoption/data/constant/app_key.dart';
import 'package:stray_dog_adoption/feature/common/data/model/user/user.dart';
import 'package:stray_dog_adoption/feature/common/presentation/cubit/login/login_cubit.dart';
import 'package:stray_dog_adoption/gen/assets.gen.dart';
import 'package:stray_dog_adoption/main.dart';
import 'package:stray_dog_adoption/utils/app_utils.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      await appRouter.replace(const AppTypeSelectionRoute());
    });
  }

  Future<bool> isRequiredType(String uid, String userType) async {
    final value = (await FirebaseFirestore.instance
            .collection(AppCollection.user)
            .doc(uid)
            .get())
        .data();
    if (value == null) {
      return true;
    }
    final userDetail = UserDetail.fromJson(value);
    return userDetail.type == userType;
  }

  Future<void> _logoutWaiting() async {
    Future.delayed(const Duration(seconds: 2), () async {
      await FirebaseAuth.instance.signOut();
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((duration) async {
      FirebaseAuth.instance.authStateChanges().listen((user) async {
        if (user == null) {
          await appRouter.replaceAll([const AppTypeSelectionRoute()]);
        } else {
          if (user.emailVerified == false) {
            await appRouter.replaceAll([const AppTypeSelectionRoute()]);
            await _logoutWaiting();
            return;
          }
          final userType =
              getIt<SharedPreferences>().getString(AppKey.userType) ?? '';
          if (await isRequiredType(user.uid, userType)) {
            // ignore: use_build_context_synchronously
            await AppUtils.context?.read<LoginCubit>().setUser(userType, user);
            await AppUtils.goToHome(userType);
          } else {
            await Fluttertoast.showToast(
              msg: 'You are not permitted to use this user type',
            );
            await _logoutWaiting();
            await appRouter.replaceAll([const AppTypeSelectionRoute()]);
          }
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Assets.images.icon.image(
          width: 200,
        ),
      ),
    );
  }
}
