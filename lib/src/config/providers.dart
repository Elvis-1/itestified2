import 'package:get_it/get_it.dart';
import 'package:itestified/src/config/theme/app_theme.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider<AuthViewModel>(
    create: (_) => GetIt.I<AuthViewModel>(),
  ),

  // ChangeNotifierProvider<ThemeViewmodel>(
  //   create: (_) => GetIt.I<ThemeViewmodel>(),
  // ),
  ChangeNotifierProvider(
    create: (_) => ThemeViewmodel(),
  ),
];
