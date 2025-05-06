import 'package:get_it/get_it.dart';
import 'package:itestified/src/config/donation_history_provider.dart';
import 'package:itestified/src/config/theme/app_theme.dart';

import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/nav/navbar.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'authprovider.dart';

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
  // ChangeNotifierProvider(
  //   create: (_) => ThemeViewmodel(),

  // ),
  ChangeNotifierProvider(
    create: (_) => AuthProvider(),
  ),
  ChangeNotifierProvider(create: (_) => DonationHistoryProvider()),
  ChangeNotifierProvider(create: (_) => NavProvider())
];
