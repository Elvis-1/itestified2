import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isGuest = false;

  bool get isGuest => _isGuest;

  void setGuestMode(bool isGuest) {
    _isGuest = isGuest;
    notifyListeners();
  }

// intergate with authviewmodel and set to false durting login
}