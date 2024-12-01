// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:stray_dog_adoption/core/di/injection.dart' as _i330;
import 'package:stray_dog_adoption/feature/admin/presentation/cubit/admin/admin_cubit.dart'
    as _i858;
import 'package:stray_dog_adoption/feature/common/presentation/cubit/login/login_cubit.dart'
    as _i920;
import 'package:stray_dog_adoption/feature/doctor/presentation/cubit/doctor_request/doctor_request_cubit.dart'
    as _i135;
import 'package:stray_dog_adoption/feature/user/presentation/cubit/adopt/adopt_cubit.dart'
    as _i991;
import 'package:stray_dog_adoption/feature/user/presentation/cubit/doctor/doctor_cubit.dart'
    as _i198;
import 'package:stray_dog_adoption/feature/user/presentation/cubit/dog/dog_cubit.dart'
    as _i193;
import 'package:stray_dog_adoption/feature/user/presentation/cubit/organization/organization_cubit.dart'
    as _i833;
import 'package:stray_dog_adoption/feature/user/presentation/cubit/user/user_cubit.dart'
    as _i403;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i135.DoctorRequestCubit>(
        () => _i135.DoctorRequestCubit());
    gh.lazySingleton<_i858.AdminCubit>(() => _i858.AdminCubit());
    gh.lazySingleton<_i833.OrganizationCubit>(() => _i833.OrganizationCubit());
    gh.lazySingleton<_i991.AdoptCubit>(() => _i991.AdoptCubit());
    gh.lazySingleton<_i193.DogCubit>(() => _i193.DogCubit());
    gh.lazySingleton<_i198.DoctorCubit>(() => _i198.DoctorCubit());
    gh.lazySingleton<_i403.UserCubit>(() => _i403.UserCubit());
    gh.lazySingleton<_i920.LoginCubit>(
        () => _i920.LoginCubit(gh<_i460.SharedPreferences>()));
    return this;
  }
}

class _$RegisterModule extends _i330.RegisterModule {}
