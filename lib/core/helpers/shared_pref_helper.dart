import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/specialization_doctors_model.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  static Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper: Data with key "$key" has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  static Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper: All data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

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

  static Future<bool> getBool(String key) async {
    debugPrint('SharedPrefHelper: Get bool with key "$key"');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  static Future<double> getDouble(String key) async {
    debugPrint('SharedPrefHelper: Get double with key "$key"');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  static Future<int> getInt(String key) async {
    debugPrint('SharedPrefHelper: Get int with key "$key"');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  static Future<String> getString(String key) async {
    debugPrint('SharedPrefHelper: Get string with key "$key"');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  static Future<void> setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
        'FlutterSecureStorage: Set secured string with key "$key" and value "$value"');
    await flutterSecureStorage.write(key: key, value: value);
  }

  static Future<String> getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    final value = await flutterSecureStorage.read(key: key) ?? '';
    debugPrint(
        'FlutterSecureStorage: Get secured string with key "$key", value: "$value" (length: ${value.length})');
    return value;
  }

  static Future<void> clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage: All secured data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }

  static Future<void> saveDoctors(
      String specialization, List<DoctorData> doctors) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final key = 'doctors_$specialization';
    final doctorsJson = doctors.map((doctor) => doctor.toJson()).toList();
    final jsonString = jsonEncode(doctorsJson);
    await sharedPreferences.setString(key, jsonString);
    debugPrint(
        'SharedPrefHelper: Saved doctors for specialization "$specialization" with key "$key"');
  }

  static Future<List<DoctorData>> getDoctors(String specialization) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final key = 'doctors_$specialization';
    final jsonString = sharedPreferences.getString(key);
    if (jsonString == null || jsonString.isEmpty) {
      debugPrint(
          'SharedPrefHelper: No doctors found for specialization "$specialization"');
      return [];
    }
    final List<dynamic> doctorsJson = jsonDecode(jsonString);
    final doctors =
        doctorsJson.map((json) => DoctorData.fromJson(json)).toList();
    debugPrint(
        'SharedPrefHelper: Retrieved ${doctors.length} doctors for specialization "$specialization"');
    return doctors;
  }

  static Future<void> clearDoctors(String specialization) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final key = 'doctors_$specialization';
    await sharedPreferences.remove(key);
    debugPrint(
        'SharedPrefHelper: Cleared doctors for specialization "$specialization" with key "$key"');
  }

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

  static Future<void> saveDoctorData(int doctorId, DoctorData doctor) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final key = 'doctor_$doctorId';
    final doctorJson = doctor.toJson();
    final jsonString = jsonEncode(doctorJson);
    await sharedPreferences.setString(key, jsonString);
    debugPrint(
        'SharedPrefHelper: Saved doctor data for ID $doctorId with key "$key"');
  }

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

  static Future<void> saveAvailableSlots(
      int doctorId, String date, List<String> slots) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final key = 'available_slots_${doctorId}_$date';
    final jsonString = jsonEncode(slots);
    await sharedPreferences.setString(key, jsonString);
    debugPrint(
        'SharedPrefHelper: Saved available slots for doctorId $doctorId, date $date with key "$key"');
  }

  static Future<List<String>> getAvailableSlots(
      int doctorId, String date) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final key = 'available_slots_${doctorId}_$date';
    final jsonString = sharedPreferences.getString(key);
    if (jsonString == null || jsonString.isEmpty) {
      debugPrint(
          'SharedPrefHelper: No available slots found for doctorId $doctorId, date $date');
      return [];
    }
    final slots = List<String>.from(jsonDecode(jsonString));
    debugPrint(
        'SharedPrefHelper: Retrieved ${slots.length} available slots for doctorId $doctorId, date $date');
    return slots;
  }

  static Future<void> clearAvailableSlots(int doctorId, String date) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final key = 'available_slots_${doctorId}_$date';
    await sharedPreferences.remove(key);
    debugPrint(
        'SharedPrefHelper: Cleared available slots for doctorId $doctorId, date $date with key "$key"');
  }

  static Future<void> clearAllAvailableSlots() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final keys = sharedPreferences.getKeys();
    for (String key in keys) {
      if (key.startsWith('available_slots_')) {
        await sharedPreferences.remove(key);
        debugPrint('SharedPrefHelper: Removed available slots with key: $key');
      }
    }
    debugPrint('SharedPrefHelper: All available slots cleared');
  }

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

  static Future<void> saveAccessToken(String token) async {
    await setSecuredString('access_token', token);
    debugPrint(
        'SharedPrefHelper: Saved access token: $token (length: ${token.length})');
  }

  static Future<String> getToken() async {
    String token = await getSecuredString('access_token');
    debugPrint(
        'SharedPrefHelper: Retrieved access token: $token (length: ${token.length})');
    return token;
  }

  static Future<String> getFullName() async {
    return await getString('full_name');
  }

  static Future<void> clearUserData() async {
    await removeData('first_name');
    await removeData('last_name');
    await removeData('full_name');
    await removeData('user_role');
    await clearAllSecuredData();
    debugPrint('SharedPrefHelper: Cleared all user-related data');
  }

  static Future<bool> checkIfLoggedInUser() async {
    String token = await getSecuredString('access_token');
    debugPrint(
        'SharedPrefHelper: Checking if logged in, token: $token (length: ${token.length})');
    return token.isNotEmpty;
  }

  static Future<void> saveForgetPasswordEmail(String email) async {
    await setData('forget_password_email', email);
    debugPrint('SharedPrefHelper: Saved forget password email: $email');
  }

  static Future<String> getForgetPasswordEmail() async {
    String email = await getString('forget_password_email');
    debugPrint('SharedPrefHelper: Retrieved forget password email: $email');
    return email;
  }

  static Future<void> saveAppointmentId(int appointmentId) async {
    await setData('appointment_id', appointmentId);
    debugPrint('SharedPrefHelper: Saved appointment ID: $appointmentId');
  }

  static Future<int> getAppointmentId() async {
    int appointmentId = await getInt('appointment_id');
    debugPrint('SharedPrefHelper: Retrieved appointment ID: $appointmentId');
    return appointmentId;
  }

  static Future<bool> isFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirst = prefs.getBool('is_first_launch') ?? true;
    debugPrint('SharedPrefHelper: Is first launch: $isFirst');
    return isFirst;
  }

  static Future<void> setFirstLaunch(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_first_launch', value);
    debugPrint('SharedPrefHelper: Set first launch to: $value');
    bool storedValue = prefs.getBool('is_first_launch') ?? true;
    debugPrint('SharedPrefHelper: Verified stored first launch: $storedValue');
  }

  static Future<void> saveUserRole(String role) async {
    await setData('user_role', role);
    debugPrint('SharedPrefHelper: Saved user role: $role');
  }

  static Future<String> getUserRole() async {
    String role = await getString('user_role');
    debugPrint('SharedPrefHelper: Retrieved user role: $role');
    return role;
  }

  static Future<void> saveDoctorName(int doctorId, String name) async {
    await setData('doctor_name_$doctorId', name);
    debugPrint('SharedPrefHelper: Saved doctor name for ID $doctorId: $name');
  }

  static Future<String> getDoctorName(int doctorId) async {
    String name = await getString('doctor_name_$doctorId');
    debugPrint(
        'SharedPrefHelper: Retrieved doctor name for ID $doctorId: $name');
    return name;
  }

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

  static Future<void> savePatientId(int patientId) async {
    await setData('patient_id', patientId);
    debugPrint('SharedPrefHelper: Saved patient ID: $patientId');
  }

  static Future<int> getPatientId() async {
    int patientId = await getInt('patient_id');
    debugPrint('SharedPrefHelper: Retrieved patient ID: $patientId');
    return patientId;
  }

  static Future<void> clearPatientId() async {
    await removeData('patient_id');
    debugPrint('SharedPrefHelper: Cleared patient ID');
  }

  // Added functions for doctor_id
  static Future<void> saveDoctorId(int doctorId) async {
    await setData('doctor_id', doctorId);
    debugPrint('SharedPrefHelper: Saved doctor ID: $doctorId');
  }

  static Future<int> getDoctorId() async {
    int doctorId = await getInt('doctor_id');
    debugPrint('SharedPrefHelper: Retrieved doctor ID: $doctorId');
    return doctorId;
  }
}
