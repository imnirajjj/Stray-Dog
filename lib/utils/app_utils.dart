import 'package:flutter/material.dart';
import 'package:stray_dog_adoption/core/router/app_router.gr.dart';
import 'package:stray_dog_adoption/data/constant/user_type.dart';
import 'package:stray_dog_adoption/main.dart';

class AppUtils {
  static BuildContext? get context => appRouter.navigatorKey.currentContext;
  static Future<void> goToHome(String userType) async {
    switch (userType) {
      case UserType.user:
        await appRouter.replaceAll([const UserMainRoute()]);
        return;
      case UserType.doctor:
        await appRouter.replaceAll([const DoctorMainRoute()]);
        return;
      case UserType.organization:
        await appRouter.replaceAll([const OrganizationMainRoute()]);
        return;
      case UserType.admin:
        await appRouter.replaceAll([const AdminMainRoute()]);
        return;
    }
  }
}
