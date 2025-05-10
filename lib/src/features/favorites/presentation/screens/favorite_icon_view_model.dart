import 'package:flutter/material.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

class FavoriteIconViewModel extends ChangeNotifier {
  bool _isFavorited = false;

  bool get isFavorited => _isFavorited;

  void toggleFavorite() {
    _isFavorited = !_isFavorited;
    notifyListeners();
  }
}

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);

    return ChangeNotifierProvider(
      create: (_) => FavoriteIconViewModel(),
      child: Consumer<FavoriteIconViewModel>(
        builder: (context, viewModel, _) {
          return GestureDetector(
            onTap: () => viewModel.toggleFavorite(),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: themeProvider.themeData.colorScheme.outline,
              child: Icon(
                viewModel.isFavorited ? Symbols.favorite : Symbols.favorite,
                color: themeProvider.themeData.colorScheme.primary,
                size: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}

// Data class to represent a favorited video or testimony
class FavoritedItem {
  final int id;
  final String type; // 'video' or 'testimony'
  final String title;
  final String church;
  final String views;
  final String date;
  final String imagePath;

  FavoritedItem({
    required this.id,
    required this.type,
    required this.title,
    required this.church,
    required this.views,
    required this.date,
    required this.imagePath,
  });
}

class FavoritesViewModel extends ChangeNotifier {
  final List<FavoritedItem> _favoritedItems = [];

  List<FavoritedItem> get favoritedItems => _favoritedItems;

  void addFavorite(FavoritedItem item) {
    if (!_favoritedItems.any((existingItem) =>
        existingItem.id == item.id && existingItem.type == item.type)) {
      _favoritedItems.add(item);
      notifyListeners();
    }
  }

  void removeFavorite(int id, String type) {
    _favoritedItems.removeWhere((item) => item.id == id && item.type == type);
    notifyListeners();
  }

  bool isFavorited(int id, String type) {
    return _favoritedItems.any((item) => item.id == id && item.type == type);
  }
}
