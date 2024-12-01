// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:flutter/material.dart' as _i27;
import 'package:stray_dog_adoption/feature/admin/presentation/screen/admin_main_screen.dart'
    as _i5;
import 'package:stray_dog_adoption/feature/admin/presentation/screen/admin_organization_screen/admin_organization_screen.dart'
    as _i6;
import 'package:stray_dog_adoption/feature/common/data/model/dog/dog.dart'
    as _i28;
import 'package:stray_dog_adoption/feature/common/data/model/user/user.dart'
    as _i26;
import 'package:stray_dog_adoption/feature/common/presentation/screen/adoption_detail_screen/adoption_detail_screen.dart'
    as _i7;
import 'package:stray_dog_adoption/feature/common/presentation/screen/adoption_request_screen/adoption_request_screen.dart'
    as _i8;
import 'package:stray_dog_adoption/feature/common/presentation/screen/app_type_selection_screen.dart'
    as _i9;
import 'package:stray_dog_adoption/feature/common/presentation/screen/login_screen/login_screen.dart'
    as _i13;
import 'package:stray_dog_adoption/feature/common/presentation/screen/register_screen/register_screen.dart'
    as _i17;
import 'package:stray_dog_adoption/feature/common/presentation/screen/splash_screen/splash_screen.dart'
    as _i18;
import 'package:stray_dog_adoption/feature/common/presentation/screen/user_list_screen/user_list_screen.dart'
    as _i21;
import 'package:stray_dog_adoption/feature/common/presentation/screen/user_setting_screen/user_setting_screen.dart'
    as _i24;
import 'package:stray_dog_adoption/feature/doctor/presentation/screen/doctor_main_screen.dart'
    as _i10;
import 'package:stray_dog_adoption/feature/doctor/presentation/screen/doctor_request_detail_screen.dart'
    as _i11;
import 'package:stray_dog_adoption/feature/doctor/presentation/screen/doctor_request_screen.dart'
    as _i12;
import 'package:stray_dog_adoption/feature/organization/presentation/screen/organization_main_screen.dart'
    as _i16;
import 'package:stray_dog_adoption/feature/user/presentation/screen/add_doctor_screen/add_doctor_screen.dart'
    as _i1;
import 'package:stray_dog_adoption/feature/user/presentation/screen/add_dog_screen/add_dog_screen.dart'
    as _i2;
import 'package:stray_dog_adoption/feature/user/presentation/screen/add_organization_screen/add_organization_screen.dart'
    as _i3;
import 'package:stray_dog_adoption/feature/user/presentation/screen/add_user_screen/add_user_screen.dart'
    as _i4;
import 'package:stray_dog_adoption/feature/user/presentation/screen/message_detail_screen/message_detail_screen.dart'
    as _i14;
import 'package:stray_dog_adoption/feature/user/presentation/screen/notification_screen/notification_screen.dart'
    as _i15;
import 'package:stray_dog_adoption/feature/user/presentation/screen/user_doctor_screen/user_doctor_screen.dart'
    as _i19;
import 'package:stray_dog_adoption/feature/user/presentation/screen/user_dog_screen/user_dog_screen.dart'
    as _i20;
import 'package:stray_dog_adoption/feature/user/presentation/screen/user_main_screen.dart'
    as _i22;
import 'package:stray_dog_adoption/feature/user/presentation/screen/user_message_screen/user_message_screen.dart'
    as _i23;

/// generated route for
/// [_i1.AddDoctorScreen]
class AddDoctorRoute extends _i25.PageRouteInfo<AddDoctorRouteArgs> {
  AddDoctorRoute({
    required _i26.UserDetail userDetail,
    bool popOnSuccess = true,
    bool showLogout = false,
    bool showSave = false,
    _i27.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          AddDoctorRoute.name,
          args: AddDoctorRouteArgs(
            userDetail: userDetail,
            popOnSuccess: popOnSuccess,
            showLogout: showLogout,
            showSave: showSave,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddDoctorRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddDoctorRouteArgs>();
      return _i1.AddDoctorScreen(
        userDetail: args.userDetail,
        popOnSuccess: args.popOnSuccess,
        showLogout: args.showLogout,
        showSave: args.showSave,
        key: args.key,
      );
    },
  );
}

class AddDoctorRouteArgs {
  const AddDoctorRouteArgs({
    required this.userDetail,
    this.popOnSuccess = true,
    this.showLogout = false,
    this.showSave = false,
    this.key,
  });

  final _i26.UserDetail userDetail;

  final bool popOnSuccess;

  final bool showLogout;

  final bool showSave;

  final _i27.Key? key;

  @override
  String toString() {
    return 'AddDoctorRouteArgs{userDetail: $userDetail, popOnSuccess: $popOnSuccess, showLogout: $showLogout, showSave: $showSave, key: $key}';
  }
}

/// generated route for
/// [_i2.AddDogScreen]
class AddDogRoute extends _i25.PageRouteInfo<AddDogRouteArgs> {
  AddDogRoute({
    _i28.Dog? dog,
    bool popOnSuccess = true,
    bool showLogout = false,
    bool showSave = false,
    bool selectOrganization = false,
    _i27.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          AddDogRoute.name,
          args: AddDogRouteArgs(
            dog: dog,
            popOnSuccess: popOnSuccess,
            showLogout: showLogout,
            showSave: showSave,
            selectOrganization: selectOrganization,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddDogRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<AddDogRouteArgs>(orElse: () => const AddDogRouteArgs());
      return _i2.AddDogScreen(
        dog: args.dog,
        popOnSuccess: args.popOnSuccess,
        showLogout: args.showLogout,
        showSave: args.showSave,
        selectOrganization: args.selectOrganization,
        key: args.key,
      );
    },
  );
}

class AddDogRouteArgs {
  const AddDogRouteArgs({
    this.dog,
    this.popOnSuccess = true,
    this.showLogout = false,
    this.showSave = false,
    this.selectOrganization = false,
    this.key,
  });

  final _i28.Dog? dog;

  final bool popOnSuccess;

  final bool showLogout;

  final bool showSave;

  final bool selectOrganization;

  final _i27.Key? key;

  @override
  String toString() {
    return 'AddDogRouteArgs{dog: $dog, popOnSuccess: $popOnSuccess, showLogout: $showLogout, showSave: $showSave, selectOrganization: $selectOrganization, key: $key}';
  }
}

/// generated route for
/// [_i3.AddOrganizationScreen]
class AddOrganizationRoute
    extends _i25.PageRouteInfo<AddOrganizationRouteArgs> {
  AddOrganizationRoute({
    required _i26.UserDetail userDetail,
    bool popOnSuccess = true,
    bool showLogout = false,
    bool showSave = false,
    _i27.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          AddOrganizationRoute.name,
          args: AddOrganizationRouteArgs(
            userDetail: userDetail,
            popOnSuccess: popOnSuccess,
            showLogout: showLogout,
            showSave: showSave,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddOrganizationRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddOrganizationRouteArgs>();
      return _i3.AddOrganizationScreen(
        userDetail: args.userDetail,
        popOnSuccess: args.popOnSuccess,
        showLogout: args.showLogout,
        showSave: args.showSave,
        key: args.key,
      );
    },
  );
}

class AddOrganizationRouteArgs {
  const AddOrganizationRouteArgs({
    required this.userDetail,
    this.popOnSuccess = true,
    this.showLogout = false,
    this.showSave = false,
    this.key,
  });

  final _i26.UserDetail userDetail;

  final bool popOnSuccess;

  final bool showLogout;

  final bool showSave;

  final _i27.Key? key;

  @override
  String toString() {
    return 'AddOrganizationRouteArgs{userDetail: $userDetail, popOnSuccess: $popOnSuccess, showLogout: $showLogout, showSave: $showSave, key: $key}';
  }
}

/// generated route for
/// [_i4.AddUserScreen]
class AddUserRoute extends _i25.PageRouteInfo<AddUserRouteArgs> {
  AddUserRoute({
    required _i26.UserDetail userDetail,
    bool popOnSuccess = true,
    bool showLogout = false,
    bool showSave = false,
    _i27.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          AddUserRoute.name,
          args: AddUserRouteArgs(
            userDetail: userDetail,
            popOnSuccess: popOnSuccess,
            showLogout: showLogout,
            showSave: showSave,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddUserRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddUserRouteArgs>();
      return _i4.AddUserScreen(
        userDetail: args.userDetail,
        popOnSuccess: args.popOnSuccess,
        showLogout: args.showLogout,
        showSave: args.showSave,
        key: args.key,
      );
    },
  );
}

class AddUserRouteArgs {
  const AddUserRouteArgs({
    required this.userDetail,
    this.popOnSuccess = true,
    this.showLogout = false,
    this.showSave = false,
    this.key,
  });

  final _i26.UserDetail userDetail;

  final bool popOnSuccess;

  final bool showLogout;

  final bool showSave;

  final _i27.Key? key;

  @override
  String toString() {
    return 'AddUserRouteArgs{userDetail: $userDetail, popOnSuccess: $popOnSuccess, showLogout: $showLogout, showSave: $showSave, key: $key}';
  }
}

/// generated route for
/// [_i5.AdminMainScreen]
class AdminMainRoute extends _i25.PageRouteInfo<void> {
  const AdminMainRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AdminMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminMainRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i5.AdminMainScreen();
    },
  );
}

/// generated route for
/// [_i6.AdminOrganizationScreen]
class AdminOrganizationRoute extends _i25.PageRouteInfo<void> {
  const AdminOrganizationRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AdminOrganizationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminOrganizationRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i6.AdminOrganizationScreen();
    },
  );
}

/// generated route for
/// [_i7.AdoptionDetailScreen]
class AdoptionDetailRoute extends _i25.PageRouteInfo<AdoptionDetailRouteArgs> {
  AdoptionDetailRoute({
    required String adoptionId,
    bool isForUser = false,
    _i27.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          AdoptionDetailRoute.name,
          args: AdoptionDetailRouteArgs(
            adoptionId: adoptionId,
            isForUser: isForUser,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AdoptionDetailRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AdoptionDetailRouteArgs>();
      return _i7.AdoptionDetailScreen(
        adoptionId: args.adoptionId,
        isForUser: args.isForUser,
        key: args.key,
      );
    },
  );
}

class AdoptionDetailRouteArgs {
  const AdoptionDetailRouteArgs({
    required this.adoptionId,
    this.isForUser = false,
    this.key,
  });

  final String adoptionId;

  final bool isForUser;

  final _i27.Key? key;

  @override
  String toString() {
    return 'AdoptionDetailRouteArgs{adoptionId: $adoptionId, isForUser: $isForUser, key: $key}';
  }
}

/// generated route for
/// [_i8.AdoptionRequestScreen]
class AdoptionRequestRoute
    extends _i25.PageRouteInfo<AdoptionRequestRouteArgs> {
  AdoptionRequestRoute({
    bool isForUser = false,
    _i27.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          AdoptionRequestRoute.name,
          args: AdoptionRequestRouteArgs(
            isForUser: isForUser,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AdoptionRequestRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AdoptionRequestRouteArgs>(
          orElse: () => const AdoptionRequestRouteArgs());
      return _i8.AdoptionRequestScreen(
        isForUser: args.isForUser,
        key: args.key,
      );
    },
  );
}

class AdoptionRequestRouteArgs {
  const AdoptionRequestRouteArgs({
    this.isForUser = false,
    this.key,
  });

  final bool isForUser;

  final _i27.Key? key;

  @override
  String toString() {
    return 'AdoptionRequestRouteArgs{isForUser: $isForUser, key: $key}';
  }
}

/// generated route for
/// [_i9.AppTypeSelectionScreen]
class AppTypeSelectionRoute extends _i25.PageRouteInfo<void> {
  const AppTypeSelectionRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AppTypeSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppTypeSelectionRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i9.AppTypeSelectionScreen();
    },
  );
}

/// generated route for
/// [_i10.DoctorMainScreen]
class DoctorMainRoute extends _i25.PageRouteInfo<void> {
  const DoctorMainRoute({List<_i25.PageRouteInfo>? children})
      : super(
          DoctorMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'DoctorMainRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i10.DoctorMainScreen();
    },
  );
}

/// generated route for
/// [_i11.DoctorRequestDetailScreen]
class DoctorRequestDetailRoute
    extends _i25.PageRouteInfo<DoctorRequestDetailRouteArgs> {
  DoctorRequestDetailRoute({
    required String doctorRequestId,
    bool isForUser = false,
    _i27.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          DoctorRequestDetailRoute.name,
          args: DoctorRequestDetailRouteArgs(
            doctorRequestId: doctorRequestId,
            isForUser: isForUser,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DoctorRequestDetailRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DoctorRequestDetailRouteArgs>();
      return _i11.DoctorRequestDetailScreen(
        doctorRequestId: args.doctorRequestId,
        isForUser: args.isForUser,
        key: args.key,
      );
    },
  );
}

class DoctorRequestDetailRouteArgs {
  const DoctorRequestDetailRouteArgs({
    required this.doctorRequestId,
    this.isForUser = false,
    this.key,
  });

  final String doctorRequestId;

  final bool isForUser;

  final _i27.Key? key;

  @override
  String toString() {
    return 'DoctorRequestDetailRouteArgs{doctorRequestId: $doctorRequestId, isForUser: $isForUser, key: $key}';
  }
}

/// generated route for
/// [_i12.DoctorRequestScreen]
class DoctorRequestRoute extends _i25.PageRouteInfo<DoctorRequestRouteArgs> {
  DoctorRequestRoute({
    bool isForUser = false,
    _i27.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          DoctorRequestRoute.name,
          args: DoctorRequestRouteArgs(
            isForUser: isForUser,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DoctorRequestRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DoctorRequestRouteArgs>(
          orElse: () => const DoctorRequestRouteArgs());
      return _i12.DoctorRequestScreen(
        isForUser: args.isForUser,
        key: args.key,
      );
    },
  );
}

class DoctorRequestRouteArgs {
  const DoctorRequestRouteArgs({
    this.isForUser = false,
    this.key,
  });

  final bool isForUser;

  final _i27.Key? key;

  @override
  String toString() {
    return 'DoctorRequestRouteArgs{isForUser: $isForUser, key: $key}';
  }
}

/// generated route for
/// [_i13.LoginScreen]
class LoginRoute extends _i25.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    required String userType,
    _i27.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            userType: userType,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return _i13.LoginScreen(
        userType: args.userType,
        key: args.key,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({
    required this.userType,
    this.key,
  });

  final String userType;

  final _i27.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{userType: $userType, key: $key}';
  }
}

/// generated route for
/// [_i14.MessageDetailScreen]
class MessageDetailRoute extends _i25.PageRouteInfo<MessageDetailRouteArgs> {
  MessageDetailRoute({
    required String otherId,
    _i27.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          MessageDetailRoute.name,
          args: MessageDetailRouteArgs(
            otherId: otherId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MessageDetailRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MessageDetailRouteArgs>();
      return _i14.MessageDetailScreen(
        otherId: args.otherId,
        key: args.key,
      );
    },
  );
}

class MessageDetailRouteArgs {
  const MessageDetailRouteArgs({
    required this.otherId,
    this.key,
  });

  final String otherId;

  final _i27.Key? key;

  @override
  String toString() {
    return 'MessageDetailRouteArgs{otherId: $otherId, key: $key}';
  }
}

/// generated route for
/// [_i15.NotificationScreen]
class NotificationRoute extends _i25.PageRouteInfo<void> {
  const NotificationRoute({List<_i25.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i15.NotificationScreen();
    },
  );
}

/// generated route for
/// [_i16.OrganizationMainScreen]
class OrganizationMainRoute extends _i25.PageRouteInfo<void> {
  const OrganizationMainRoute({List<_i25.PageRouteInfo>? children})
      : super(
          OrganizationMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrganizationMainRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i16.OrganizationMainScreen();
    },
  );
}

/// generated route for
/// [_i17.RegisterScreen]
class RegisterRoute extends _i25.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    required String userType,
    _i27.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(
            userType: userType,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>();
      return _i17.RegisterScreen(
        userType: args.userType,
        key: args.key,
      );
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({
    required this.userType,
    this.key,
  });

  final String userType;

  final _i27.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{userType: $userType, key: $key}';
  }
}

/// generated route for
/// [_i18.SplashScreen]
class SplashRoute extends _i25.PageRouteInfo<void> {
  const SplashRoute({List<_i25.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i18.SplashScreen();
    },
  );
}

/// generated route for
/// [_i19.UserDoctorScreen]
class UserDoctorRoute extends _i25.PageRouteInfo<void> {
  const UserDoctorRoute({List<_i25.PageRouteInfo>? children})
      : super(
          UserDoctorRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserDoctorRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i19.UserDoctorScreen();
    },
  );
}

/// generated route for
/// [_i20.UserDogScreen]
class UserDogRoute extends _i25.PageRouteInfo<UserDogRouteArgs> {
  UserDogRoute({
    String? uid,
    _i27.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          UserDogRoute.name,
          args: UserDogRouteArgs(
            uid: uid,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UserDogRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<UserDogRouteArgs>(orElse: () => const UserDogRouteArgs());
      return _i20.UserDogScreen(
        uid: args.uid,
        key: args.key,
      );
    },
  );
}

class UserDogRouteArgs {
  const UserDogRouteArgs({
    this.uid,
    this.key,
  });

  final String? uid;

  final _i27.Key? key;

  @override
  String toString() {
    return 'UserDogRouteArgs{uid: $uid, key: $key}';
  }
}

/// generated route for
/// [_i21.UserListScreen]
class UserListRoute extends _i25.PageRouteInfo<UserListRouteArgs> {
  UserListRoute({
    required String userType,
    required void Function(_i26.UserDetail) onUserSelected,
    _i27.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          UserListRoute.name,
          args: UserListRouteArgs(
            userType: userType,
            onUserSelected: onUserSelected,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UserListRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserListRouteArgs>();
      return _i21.UserListScreen(
        userType: args.userType,
        onUserSelected: args.onUserSelected,
        key: args.key,
      );
    },
  );
}

class UserListRouteArgs {
  const UserListRouteArgs({
    required this.userType,
    required this.onUserSelected,
    this.key,
  });

  final String userType;

  final void Function(_i26.UserDetail) onUserSelected;

  final _i27.Key? key;

  @override
  String toString() {
    return 'UserListRouteArgs{userType: $userType, onUserSelected: $onUserSelected, key: $key}';
  }
}

/// generated route for
/// [_i22.UserMainScreen]
class UserMainRoute extends _i25.PageRouteInfo<void> {
  const UserMainRoute({List<_i25.PageRouteInfo>? children})
      : super(
          UserMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserMainRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i22.UserMainScreen();
    },
  );
}

/// generated route for
/// [_i23.UserMessageScreen]
class UserMessageRoute extends _i25.PageRouteInfo<void> {
  const UserMessageRoute({List<_i25.PageRouteInfo>? children})
      : super(
          UserMessageRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserMessageRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i23.UserMessageScreen();
    },
  );
}

/// generated route for
/// [_i24.UserSettingScreen]
class UserSettingRoute extends _i25.PageRouteInfo<void> {
  const UserSettingRoute({List<_i25.PageRouteInfo>? children})
      : super(
          UserSettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserSettingRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i24.UserSettingScreen();
    },
  );
}
