import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class _SharedPreferencesKey {
  static const sharedkey = 'name_key';
}

abstract class _FlutterSecureStorageKey {
  static const token = 'token';
}

class ExampleWidgetModel {
  get dataValue => data;

  get tokenGet => tokenData;
  String? data;
  String? tokenData;
  final _storage = SharedPreferences.getInstance();
  final _secureStorage = const FlutterSecureStorage();

  Future readName() async {
    final storage = await _storage;
    data = storage.getString(_SharedPreferencesKey.sharedkey);
    print(data);
    return data;
  }

  Future<void> setName({required TextEditingController controller}) async {
    final storage = await _storage;

    storage.setString(_SharedPreferencesKey.sharedkey, controller.text);
  }

  Future readToken() async {
    final secureStorage = _secureStorage;
    tokenData =
        secureStorage.read(key: _FlutterSecureStorageKey.token) as String?;
    return tokenData;
  }

  Future<void> setToken(
      {required TextEditingController textEditingController}) async {
    final secureStorage = _secureStorage;
    secureStorage.write(
        key: _FlutterSecureStorageKey.token, value: textEditingController.text);
  }
}

class ExampleModel2 {
  final _storage = SharedPreferences.getInstance();
  final _secureStorage = const FlutterSecureStorage();

  Future<void> readName() async {
    final storage = await _storage;
    final data = storage.getString(_SharedPreferencesKey.sharedkey);
    debugPrint('$data');
  }
  Future<void> setName() async {
    final storage = await _storage;
    final data = storage.setString(_SharedPreferencesKey.sharedkey, 'Salom');
    debugPrint('$data');
  }
  Future<void> getToken() async {
    final storageSecure =  _secureStorage;
    final data = storageSecure.read(key: _FlutterSecureStorageKey.token);
    debugPrint('$data');
  }
  Future<void> setToken() async {
    final storageSecure =  _secureStorage;
    final data = storageSecure.write(key: _FlutterSecureStorageKey.token,value: '11111111111111111111');
    debugPrint('$data');
  }
}
