import 'dart:developer';
import 'package:appifylabtask/src/config/import/imports.dart';
import 'package:appifylabtask/src/core/utils/session_manager/prefs_keys.dart';

class SessionManager {

  static SessionManager? _instance;
  SessionManager._internal();
  factory SessionManager(){
    _instance ??= SessionManager._internal();
    return _instance!;
  }

  late GetStorage prefs;

  Future<void> init() async {
    try {
      await GetStorage.init();
      prefs = GetStorage();
    } catch (e) {
      log('Error initializing GetStorage: $e');
    }
  }

  Future<void> setIsLogin({
    required bool isLogin,
  }) async {
    prefs.write(prefsIsLogin, isLogin);
  }

  bool getIsLogin(){
    return prefs.read(prefsIsLogin) ?? false;
  }

  Future<void> setTokenType(
      String tokenType,
      ) async {
    await prefs.write(
      prefTokenType,
      tokenType,
    );
  }

  Future<String> getTokenType() async {
    return prefs.read(prefTokenType);
  }

  Future<void> setToken(
      String token,
      ) async {
    await prefs.write(
      prefToken,
      token,
    );
  }

  Future<String> getToken() async {
    return prefs.read(prefToken);
  }


  Future<void> clearSession() async {
    //await prefs.erase();
    await prefs.remove(prefTokenType);
    await prefs.remove(prefToken);
    await prefs.remove(prefsIsLogin);
  }
}