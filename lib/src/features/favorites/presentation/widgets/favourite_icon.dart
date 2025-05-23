import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/favorites/presentation/screens/favorite_icon_view_model.dart';
import 'package:provider/provider.dart';

class FavoriteIcon extends StatelessWidget {
  final FavoritedItem item;
  final double radius;
  final double iconSize;

  const FavoriteIcon({
    super.key,
    required this.item,
    this.radius = 16.0,
    this.iconSize = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I<FavoriteIconViewModel>();
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final isLightMode = themeProvider.themeData.brightness == Brightness.light;

  
    final backgroundColor = isLightMode
        ? const Color(0xBFFFFFFF) 
        : themeProvider.themeData.colorScheme.outline;

    final inactiveIconColor = isLightMode ? Colors.black : Colors.white;
    final activeIconColor = AppColors.primaryColor; 

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLargeScreen = constraints.maxWidth > 800;
        final double avatarRadius = isLargeScreen ? 16 : 14;

        return ValueListenableBuilder<List<FavoritedItem>>(
          valueListenable: GetIt.I<ValueListenable<List<FavoritedItem>>>(),
          builder: (context, favorites, child) {
            final isFavorited =
                favorites.any((f) => f.id == item.id && f.type == item.type);
            print(
                'FavoriteIcon: Building, itemId=${item.id}, type=${item.type}, isFavorited=$isFavorited, favoritesCount=${favorites.length}, radius=$avatarRadius');
            return GestureDetector(
              onTap: () {
                print(
                    'FavoriteIcon: Clicked, itemId=${item.id}, type=${item.type}, currentState=$isFavorited');
                viewModel.toggleFavorite(item);
              },
              child: CircleAvatar(
                radius: radius != 16.0 ? radius : avatarRadius,
                backgroundColor: backgroundColor,
                child: Icon(
                  isFavorited ? Icons.favorite : Icons.favorite_border,
                  color: isFavorited ? activeIconColor : inactiveIconColor,
                  size: iconSize,
                ),
              ),
            );
          },
        );
      },
    );
  }
}