import 'package:get_it/get_it.dart';
import 'package:itestified/src/config/network/api_client.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';

import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);

  sl.registerLazySingleton<ApiClient>(() => ApiClient(authLocalSource: sl()));

  _registerDataSources();

  // register services
  _registerServices();

  // register viewmodels
  _registerViewModels();
}

void _registerViewModels() {
  // sl.registerFactory(() => RegisterViewModel(sl()));
  sl.registerFactory(() => ThemeViewmodel());
}

void _registerDataSources() {
  // sl
  //   ..registerLazySingleton<AuthLocalSource>(() => AuthLocalSourceImpl(sl()))
  //   // same data source for all auth pr
  //   ..registerLazySingleton<AuthApi>(() => AuthApiImpl(sl()));
}

void _registerServices() {
  // sl
  //   ..registerLazySingleton<RegisterService>(
  //       () => RegisterServiceImpl(authApi: sl()))
}
