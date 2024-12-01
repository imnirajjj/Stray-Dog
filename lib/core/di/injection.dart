import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stray_dog_adoption/core/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<GetIt> configureInjection() async => getIt.init();

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> prefs() => SharedPreferences.getInstance();
}
