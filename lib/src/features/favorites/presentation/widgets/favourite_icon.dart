import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/favorites/presentation/screens/favorite_icon_view_model.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

class FavoriteIcon extends StatelessWidget {
  final FavoritedItem item;

  const FavoriteIcon({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I<FavoriteIconViewModel>();
    final themeProvider = Provider.of<ThemeViewmodel>(context);

    return GestureDetector(
      onTap: () => viewModel.toggleFavorite(item),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: themeProvider.themeData.colorScheme.outline,
        child: Icon(
          viewModel.isFavorited(item.id, item.type) ? Symbols.favorite : Symbols.favorite_border,
          color: themeProvider.themeData.colorScheme.primary,
          size: 20,
        ),
      ),
    );
  }
}