import 'package:get_it/get_it.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:itestified/src/features/favorites/presentation/screens/favorite_icon_view_model.dart';
import 'package:itestified/src/features/nav/navbar.dart';
import 'package:itestified/src/features/video/view_model/video_player_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ThemeViewmodel>(
    create: (_) => GetIt.I<ThemeViewmodel>(),
  ),
  ChangeNotifierProvider<AuthViewModel>(
    create: (_) => GetIt.I<AuthViewModel>(),
  ),
  
  ChangeNotifierProvider<NavProvider>(
    create: (_) => GetIt.I<NavProvider>(),
  ),
  ChangeNotifierProvider<FavoritesViewModel>(
    create: (_) => GetIt.I<FavoritesViewModel>(),
  ),
  ChangeNotifierProvider<VideoViewModel>(
    create: (_) => GetIt.I<VideoViewModel>(),
  ),
];