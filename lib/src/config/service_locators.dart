import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:itestified/src/config/network/api_client.dart';
import 'package:itestified/src/config/utils/local/auth_local_source.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/data/aut_api.dart';
import 'package:itestified/src/features/auth/domain/service/auth_service.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/screens/video_written_test_screen.dart';
import 'package:itestified/src/features/favorites/presentation/screens/favorite_icon_view_model.dart';
import 'package:itestified/src/features/favorites/services/favourite_service.dart';
import 'package:itestified/src/features/home/presentation/home_screen_viewmodel.dart';
import 'package:itestified/src/features/home/widget/video_testimoies_carousal.dart';
import 'package:itestified/src/features/nav/navbar.dart';
import 'package:itestified/src/features/profile/data/profile_api.dart';
import 'package:itestified/src/features/profile/domain/donation_service.dart';
import 'package:itestified/src/features/profile/domain/review_service.dart';
import 'package:itestified/src/features/profile/presentation/viewmodel/donation_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/viewmodel/review_viewmodel.dart';
import 'package:itestified/src/features/written_testimonies.dart/presentation/screens/video_testimony_viewmodel.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../features/video/view_model/video_player_provider.dart';

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
    ..registerFactory(() => DonationViewmodel())
    ..registerFactory(() => VideoViewModel())
    ..registerFactory(() => NavProvider())
    ..registerFactory(() => FavoritesViewModel())
    ..registerFactory(() => HomeScreenViewModel())
    ..registerFactory(() => ReviewViewModel())
    ..registerFactory(() => FavoriteIconViewModel())
    ..registerFactory(() => VideoWrittenTestimoniesViewModel())
    ..registerFactory(() => VideoTestimoniesCarouselViewModel())
    ..registerFactoryParam<VideoTestimonyViewModel, int, void>(
      (videoId, _) => VideoTestimonyViewModel(videoId: videoId),
    );
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
    ..registerLazySingleton<DonationService>(() => DonationServicesImp(sl()))
    ..registerLazySingleton<FavoritesService>(() => FavoritesServiceImpl(sl()))
    ..registerSingleton<ValueListenable<List<FavoritedItem>>>(FavoritesServiceImpl(sl()))
    ..registerLazySingleton<VideoService>(() => VideoServiceImpl())
    ..registerLazySingleton<ReviewService>(() => ReviewServiceImpl());
}
