import 'package:get_it/get_it.dart';
import 'package:itestified/src/config/network/api_client.dart';
import 'package:itestified/src/config/utils/local/auth_local_source.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/data/aut_api.dart';
import 'package:itestified/src/features/auth/domain/service/auth_service.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/profile/data/profile_api.dart';
import 'package:itestified/src/features/profile/domain/donation_service.dart';
import 'package:itestified/src/features/profile/presentation/viewmodel/donation_viewmodel.dart';

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
  sl
    ..registerFactory(() => AuthViewModel(sl()))
    ..registerFactory(() => ThemeViewmodel())
    ..registerFactory(() => DonationViewmodel());
}

void _registerDataSources() {
  sl
    ..registerLazySingleton<AuthLocalSource>(() => AuthLocalSourceImpl(sl()))
    //   // same data source for all auth pr
    ..registerLazySingleton<AuthApi>(() => AuthApiImpl(sl()))
    ..registerLazySingleton<ProfileApi>(() => ProfileApiImpl(sl()));
}

void _registerServices() {
  sl
    ..registerLazySingleton<AuthService>(() => AuthServiceImpl(authApi: sl()))
    ..registerLazySingleton<DonationService>(() => DonationServicesImp(sl()));
}
