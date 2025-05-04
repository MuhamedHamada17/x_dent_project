import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // private constructor to prevent creating instances of this class
  SharedPrefHelper._();

  /// Removes a value from SharedPreferences with given [key].
  static removeData(String key) async {
    debugPrint('SharedPrefHelper: Data with key "$key" has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in SharedPreferences.
  static clearAllData() async {
    debugPrint('SharedPrefHelper: All data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in SharedPreferences.
  static setData(String key, dynamic value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper: Set data with key "$key" and value "$value"');
    switch (value.runtimeType) {
      case String:
        await sharedPreferences.setString(key, value);
        break;
      case int:
        await sharedPreferences.setInt(key, value);
        break;
      case bool:
        await sharedPreferences.setBool(key, value);
        break;
      case double:
        await sharedPreferences.setDouble(key, value);
        break;
      default:
        debugPrint('SharedPrefHelper: Unsupported type for key "$key"');
        return null;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static Future<bool> getBool(String key) async {
    debugPrint('SharedPrefHelper: Get bool with key "$key"');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static Future<double> getDouble(String key) async {
    debugPrint('SharedPrefHelper: Get double with key "$key"');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static Future<int> getInt(String key) async {
    debugPrint('SharedPrefHelper: Get int with key "$key"');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets a String value from SharedPreferences with given [key].
  static Future<String> getString(String key) async {
    debugPrint('SharedPrefHelper: Get string with key "$key"');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  /// Saves a sensitive [value] with a [key] in FlutterSecureStorage (e.g., access_token).
  static setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
        'FlutterSecureStorage: Set secured string with key "$key" and value "$value"');
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets a String value from FlutterSecureStorage with given [key] (e.g., access_token).
  static Future<String> getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage: Get secured string with key "$key"');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Removes all keys and values in FlutterSecureStorage.
  static clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage: All secured data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }

  // دوال إضافية مخصصة لتخزين واسترداد بيانات المستخدم
  /// Saves user data (first_name, last_name, full_name) in SharedPreferences.
  static Future<void> saveUserData({
    required String firstName,
    required String lastName,
    String? fullName,
  }) async {
    await setData('first_name', firstName);
    await setData('last_name', lastName);
    if (fullName != null) {
      await setData('full_name', fullName);
    }
  }

  /// Saves access token in FlutterSecureStorage.
  static Future<void> saveAccessToken(String token) async {
    await setSecuredString('access_token', token);
  }

  /// Gets full user name from SharedPreferences.
  static Future<String> getFullName() async {
    return await getString('full_name');
  }

  /// Clears all user-related data (name and token).
  static Future<void> clearUserData() async {
    await removeData('first_name');
    await removeData('last_name');
    await removeData('full_name');
    await clearAllSecuredData();
  }
}