import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalSource {
  // User? getUser();
  // Future<void> saveUser(User user);
  Future<void> deleteUser();
  // String? getAccessToken();
  bool? getBool(String key);
  Future<void> deleteBool(String key);
  Future<void> saveBool(String key, {bool value});
  Future<void> storeAccesskey(String token);
  String retrieveAccessToken();
  Future<void> saveString(String key, String value);
  String? getString(String key);
  Future<void> deleteString(String key);
}

class AuthLocalSourceImpl extends AuthLocalSource {
  AuthLocalSourceImpl(this.prefs);
  final SharedPreferences prefs;
  final accessKey = 'access_key';

  // @override
  // String? getAccessToken() {
  //   final user = getUser();
  //   return user?.token;
  // }

  @override
  // User? getUser() {
  //   final userJson = prefs.getString('user');
  //   if (userJson == null) {
  //     return null;
  //   }
  //   return User.fromJson(json.decode(userJson));
  // }

  // @override
  // Future<void> saveUser(User user) async {
  //   await prefs.setString('user', const JsonEncoder().convert(user.toJson()));
  // }

  @override
  Future<void> deleteUser() async {
    await prefs.remove('user');
  }

  @override
  Future<void> deleteBool(String key) async {
    await prefs.remove(key);
  }

  @override
  bool? getBool(String key) {
    return prefs.getBool(key);
  }

  @override
  Future<void> saveBool(String key, {bool value = false}) async {
    await prefs.setBool(key, value);
  }

// store the token to access other route
  @override
  Future<void> storeAccesskey(String token) async {
    await prefs.setString(accessKey, token);
    print('Printing access token in auth local class');
    print(prefs.getString(accessKey));
  }

  // return access key
  @override
  retrieveAccessToken() {
    print('Printing access token in auth local class');
    print(prefs.getString(accessKey));
    return prefs.getString(accessKey) ?? '';
  }

  @override
  String? getString(String key) {
    return prefs.getString(key);
  }

  @override
  Future<void> saveString(String key, String value) async {
    await prefs.setString(key, value);
  }

  @override
  Future<void> deleteString(String key) async {
    await prefs.remove(key);
  }
}
