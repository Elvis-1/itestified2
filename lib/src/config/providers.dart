import 'package:get_it/get_it.dart';

import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/category/presentation/screens/video_written_test_screen.dart';
import 'package:itestified/src/features/favorites/presentation/screens/favorite_icon_view_model.dart';
import 'package:itestified/src/features/nav/navbar.dart';
import 'package:itestified/src/features/profile/presentation/viewmodel/donation_viewmodel.dart';
import 'package:itestified/src/features/video/utiils/constants.dart';
import 'package:itestified/src/features/video/view_model/video_player_provider.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  // ChangeNotifierProvider<RegisterViewModel>(
  //   create: (_) => GetIt.I<RegisterViewModel>(),
  // ),

  ChangeNotifierProvider<ThemeViewmodel>(
    create: (_) => GetIt.I<ThemeViewmodel>(),
  ),

  ChangeNotifierProvider<AuthViewModel>(
    create: (_) => GetIt.I<AuthViewModel>(),
  ),

  ChangeNotifierProvider<DonationViewmodel>(
    create: (_) => GetIt.I<DonationViewmodel>(),
  ),
  // ChangeNotifierProvider(
  //   create: (_) => ThemeViewmodel(),

  // ),

  ChangeNotifierProvider(create: (_) => DonationViewmodel()),
  ChangeNotifierProvider(create: (_) => NavProvider()),
  ChangeNotifierProvider(create: (_) => FavoritesViewModel()),

  ChangeNotifierProvider(create: (_) => VideoWrittenTestimoniesViewModel()),
  ChangeNotifierProvider(create: (_) => VideoViewModel()),
];
