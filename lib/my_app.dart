import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stray_dog_adoption/core/di/injection.dart';
import 'package:stray_dog_adoption/core/extension/theme_extension.dart';
import 'package:stray_dog_adoption/core/theme/app_theme.dart';
import 'package:stray_dog_adoption/feature/admin/presentation/cubit/admin/admin_cubit.dart';
import 'package:stray_dog_adoption/feature/common/presentation/cubit/login/login_cubit.dart';
import 'package:stray_dog_adoption/feature/doctor/presentation/cubit/doctor_request/doctor_request_cubit.dart';
import 'package:stray_dog_adoption/feature/user/presentation/cubit/adopt/adopt_cubit.dart';
import 'package:stray_dog_adoption/feature/user/presentation/cubit/doctor/doctor_cubit.dart';
import 'package:stray_dog_adoption/feature/user/presentation/cubit/dog/dog_cubit.dart';
import 'package:stray_dog_adoption/feature/user/presentation/cubit/organization/organization_cubit.dart';
import 'package:stray_dog_adoption/feature/user/presentation/cubit/user/user_cubit.dart';
import 'package:stray_dog_adoption/main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LoginCubit>()),
        BlocProvider(create: (context) => getIt<AdminCubit>()),
        BlocProvider(create: (context) => getIt<OrganizationCubit>()),
        BlocProvider(create: (context) => getIt<DoctorCubit>()),
        BlocProvider(create: (context) => getIt<UserCubit>()),
        BlocProvider(create: (context) => getIt<DogCubit>()),
        BlocProvider(create: (context) => getIt<AdoptCubit>()),
        BlocProvider(create: (context) => getIt<DoctorRequestCubit>()),
      ],
      child: DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
          isWallpaperColorPickingSupported =
              lightDynamic != null && darkDynamic != null;
          return MaterialApp.router(
            title: 'Stray Dog Adoption',
            debugShowCheckedModeBanner: false,
            theme: AppThemeData.lightTheme(lightDynamic).getDefaultStyle(),
            routerConfig: appRouter.config(),
          );
        },
      ),
    );
  }
}
