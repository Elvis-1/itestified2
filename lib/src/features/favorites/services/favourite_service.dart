import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:itestified/src/config/utils/local/auth_local_source.dart';
import 'package:itestified/src/features/favorites/presentation/screens/favorite_icon_view_model.dart';

abstract class FavoritesService {
  List<FavoritedItem> getFavoritedItems();
  void addFavorite(FavoritedItem item);
  void removeFavorite(int id, String type);
  bool isFavorited(int id, String type);
}

class FavoritesServiceImpl extends ValueNotifier<List<FavoritedItem>> implements FavoritesService {
  final AuthLocalSource _authLocalSource;
  static const String _favoritesKey = 'favorited_items';
  static FavoritesServiceImpl? _instance;

  factory FavoritesServiceImpl(AuthLocalSource authLocalSource) {
    _instance ??= FavoritesServiceImpl._internal(authLocalSource);
    return _instance!;
  }

  FavoritesServiceImpl._internal(this._authLocalSource) : super([]) {
    _loadFavorites();
    print('FavoritesServiceImpl initialized: $this');
  }

  void _loadFavorites() {
    final favoritesJson = _authLocalSource.getString(_favoritesKey);
    if (favoritesJson != null) {
      try {
        final List<dynamic> jsonList = json.decode(favoritesJson);
        value = jsonList
            .map((json) => FavoritedItem.fromJson(json as Map<String, dynamic>))
            .toList();
        print('Favorites loaded: ${value.length} items');
      } catch (e) {
        print('Error decoding favorites: $e');
        value = [];
      }
    }
  }

  @override
  List<FavoritedItem> getFavoritedItems() => value;

  @override
  void addFavorite(FavoritedItem item) {
    if (!value.any((existing) => existing.id == item.id && existing.type == item.type)) {
      value = [...value, item];
      _saveFavorites();
      print('Added favorite: ${item.id}, ${item.type}, total: ${value.length}');
    } else {
      print('Favorite already exists: ${item.id}, ${item.type}');
    }
  }

  @override
  void removeFavorite(int id, String type) {
    value = value.where((item) => !(item.id == id && item.type == type)).toList();
    _saveFavorites();
    print('Removed favorite: $id, $type, total: ${value.length}');
  }

  @override
  bool isFavorited(int id, String type) {
    final isFavorited = value.any((item) => item.id == id && item.type == type);
    print('Checked isFavorited: $id, $type -> $isFavorited');
    return isFavorited;
  }

  void _saveFavorites() {
    final jsonList = value.map((item) => item.toJson()).toList();
    _authLocalSource.saveString(_favoritesKey, json.encode(jsonList));
    print('Saving favorites: ${value.length} items');
    notifyListeners();
  }
}