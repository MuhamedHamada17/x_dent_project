// shared_pref_helper.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/specialization_doctors_model.dart';

class SharedPrefHelper {
  // Private constructor to prevent creating instances of this class
  SharedPrefHelper._();

  /// Removes a value from SharedPreferences with given [key].
  static Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper: Data with key "$key" has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in SharedPreferences.
  static Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper: All data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in SharedPreferences.
  static Future<void> setData(String key, dynamic value) async {
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
        throw Exception('Unsupported type for key "$key"');
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
  static Future<void> setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage: Set secured string with key "$key" and value "$value"');
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets a String value from FlutterSecureStorage with given [key] (e.g., access_token).
  static Future<String> getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage: Get secured string with key "$key"');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Removes all keys and values in FlutterSecureStorage.
  static Future<void> clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage: All secured data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }

  /// Saves a list of doctors for a given specialization in SharedPreferences as JSON.
  static Future<void> saveDoctors(String specialization, List<DoctorData> doctors) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final key = 'doctors_$specialization';
    final doctorsJson = doctors.map((doctor) => doctor.toJson()).toList();
    final jsonString = jsonEncode(doctorsJson);
    await sharedPreferences.setString(key, jsonString);
    debugPrint('SharedPrefHelper: Saved doctors for specialization "$specialization" with key "$key"');
  }

  /// Gets a list of doctors for a given specialization from SharedPreferences.
  static Future<List<DoctorData>> getDoctors(String specialization) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final key = 'doctors_$specialization';
    final jsonString = sharedPreferences.getString(key);
    if (jsonString == null || jsonString.isEmpty) {
      debugPrint('SharedPrefHelper: No doctors found for specialization "$specialization"');
      return [];
    }
    final List<dynamic> doctorsJson = jsonDecode(jsonString);
    final doctors = doctorsJson.map((json) => DoctorData.fromJson(json)).toList();
    debugPrint('SharedPrefHelper: Retrieved ${doctors.length} doctors for specialization "$specialization"');
    return doctors;
  }

  /// Clears all stored doctors for a given specialization.
  static Future<void> clearDoctors(String specialization) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final key = 'doctors_$specialization';
    await sharedPreferences.remove(key);
    debugPrint('SharedPrefHelper: Cleared doctors for specialization "$specialization" with key "$key"');
  }

  /// Clears all stored doctors for all specializations.
  static Future<void> clearAllDoctors() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final keys = sharedPreferences.getKeys();
    for (String key in keys) {
      if (key.startsWith('doctors_')) {
        await sharedPreferences.remove(key);
        debugPrint('SharedPrefHelper: Removed doctors with key: $key');
      }
    }
    debugPrint('SharedPrefHelper: All doctors cleared');
  }

  /// Saves a single doctor's data in SharedPreferences using doctorId as key.
  static Future<void> saveDoctorData(int doctorId, DoctorData doctor) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final key = 'doctor_$doctorId';
    final doctorJson = doctor.toJson();
    final jsonString = jsonEncode(doctorJson);
    await sharedPreferences.setString(key, jsonString);
    debugPrint('SharedPrefHelper: Saved doctor data for ID $doctorId with key "$key"');
  }

  /// Gets a single doctor's data from SharedPreferences using doctorId.
  static Future<DoctorData?> getDoctorData(int doctorId) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final key = 'doctor_$doctorId';
    final jsonString = sharedPreferences.getString(key);
    if (jsonString == null || jsonString.isEmpty) {
      debugPrint('SharedPrefHelper: No doctor data found for ID $doctorId');
      return null;
    }
    final doctorJson = jsonDecode(jsonString);
    final doctor = DoctorData.fromJson(doctorJson);
    debugPrint('SharedPrefHelper: Retrieved doctor data for ID $doctorId');
    return doctor;
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
    debugPrint('SharedPrefHelper: Saved access token: $token');
  }

  /// Gets full user name from SharedPreferences.
  static Future<String> getFullName() async {
    return await getString('full_name');
  }

  /// Clears all user-related data (name, role, and token).
  static Future<void> clearUserData() async {
    await removeData('first_name');
    await removeData('last_name');
    await removeData('full_name');
    await removeData('user_role');
    await clearAllSecuredData();
  }

  /// Checks if the user is logged in by verifying the existence of a valid access token.
  static Future<bool> checkIfLoggedInUser() async {
    String token = await getSecuredString('access_token');
    debugPrint('SharedPrefHelper: Checking if logged in, token: $token');
    return token.isNotEmpty;
  }

  /// Saves forget password email in SharedPreferences.
  static Future<void> saveForgetPasswordEmail(String email) async {
    await setData('forget_password_email', email);
    debugPrint('SharedPrefHelper: Saved forget password email: $email');
  }

  /// Gets forget password email from SharedPreferences.
  static Future<String> getForgetPasswordEmail() async {
    String email = await getString('forget_password_email');
    debugPrint('SharedPrefHelper: Retrieved forget password email: $email');
    return email;
  }

  /// Saves appointment ID in SharedPreferences.
  static Future<void> saveAppointmentId(int appointmentId) async {
    await setData('appointment_id', appointmentId);
    debugPrint('SharedPrefHelper: Saved appointment ID: $appointmentId');
  }

  /// Gets appointment ID from SharedPreferences.
  static Future<int> getAppointmentId() async {
    int appointmentId = await getInt('appointment_id');
    debugPrint('SharedPrefHelper: Retrieved appointment ID: $appointmentId');
    return appointmentId;
  }

  /// Checks if the app is launched for the first time.
  static Future<bool> isFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirst = prefs.getBool('is_first_launch') ?? true;
    debugPrint('SharedPrefHelper: Is first launch: $isFirst');
    return isFirst;
  }

  /// Sets the first launch status.
  static Future<void> setFirstLaunch(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_first_launch', value);
    debugPrint('SharedPrefHelper: Set first launch to: $value');
    bool storedValue = prefs.getBool('is_first_launch') ?? true;
    debugPrint('SharedPrefHelper: Verified stored first launch: $storedValue');
  }

  /// Saves user role (doctor or patient) in SharedPreferences.
  static Future<void> saveUserRole(String role) async {
    await setData('user_role', role);
    debugPrint('SharedPrefHelper: Saved user role: $role');
  }

  /// Gets user role from SharedPreferences.
  static Future<String> getUserRole() async {
    String role = await getString('user_role');
    debugPrint('SharedPrefHelper: Retrieved user role: $role');
    return role;
  }

  /// Saves doctor's name in SharedPreferences using doctor_id as key.
  static Future<void> saveDoctorName(int doctorId, String name) async {
    await setData('doctor_name_$doctorId', name);
    debugPrint('SharedPrefHelper: Saved doctor name for ID $doctorId: $name');
  }

  /// Gets doctor's name from SharedPreferences using doctor_id.
  static Future<String> getDoctorName(int doctorId) async {
    String name = await getString('doctor_name_$doctorId');
    debugPrint('SharedPrefHelper: Retrieved doctor name for ID $doctorId: $name');
    return name;
  }

  /// Clears all doctor names from SharedPreferences.
  static Future<void> clearAllDoctorNames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for (String key in keys) {
      if (key.startsWith('doctor_name_')) {
        await prefs.remove(key);
        debugPrint('SharedPrefHelper: Removed doctor name with key: $key');
      }
    }
    debugPrint('SharedPrefHelper: All doctor names cleared');
  }
}