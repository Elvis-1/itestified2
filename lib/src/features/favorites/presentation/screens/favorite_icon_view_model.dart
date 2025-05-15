import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:itestified/src/features/favorites/services/favourite_service.dart';

// Data class for favorited items
class FavoritedItem {
  final int id;
  final String type; // 'video', 'post', 'inspiration'
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

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'title': title,
        'church': church,
        'views': views,
        'date': date,
        'imagePath': imagePath,
      };

  factory FavoritedItem.fromJson(Map<String, dynamic> json) => FavoritedItem(
        id: json['id'] as int,
        type: json['type'] as String,
        title: json['title'] as String,
        church: json['church'] as String,
        views: json['views'] as String,
        date: json['date'] as String,
        imagePath: json['imagePath'] as String,
      );
}

class FavoriteIconViewModel {
  final FavoritesService _service = GetIt.I<FavoritesService>();

  bool isFavorited(int id, String type) => _service.isFavorited(id, type);

  void toggleFavorite(FavoritedItem item) {
    if (_service.isFavorited(item.id, item.type)) {
      _service.removeFavorite(item.id, item.type);
    } else {
      _service.addFavorite(item);
    }
  }
}

class FavoritesViewModel {
  final FavoritesService _service = GetIt.I<FavoritesService>();

  List<FavoritedItem> get favoritedItems => _service.getFavoritedItems();

  void addFavorite(FavoritedItem item) => _service.addFavorite(item);

  void removeFavorite(int id, String type) => _service.removeFavorite(id, type);

  bool isFavorited(int id, String type) => _service.isFavorited(id, type);
}