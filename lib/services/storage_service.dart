import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StorageService {
  static const String _usersKey = 'users_list';
  static const String _currentUserKey = 'current_user';
  static const String _isLoggedInKey = 'is_logged_in';

  // Save a string value
  static Future<bool> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  // Get a string value
  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // Save a boolean value
  static Future<bool> saveBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(key, value);
  }

  // Get a boolean value
  static Future<bool> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  // Save a list of strings
  static Future<bool> saveStringList(String key, List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList(key, value);
  }

  // Get a list of strings
  static Future<List<String>> getStringList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  // Remove a value
  static Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }

  // Clear all data
  static Future<bool> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }

  // Save object as JSON string
  static Future<bool> saveObject(String key, Map<String, dynamic> object) async {
    final jsonString = jsonEncode(object);
    return await saveString(key, jsonString);
  }

  // Get object from JSON string
  static Future<Map<String, dynamic>?> getObject(String key) async {
    final jsonString = await getString(key);
    if (jsonString == null) return null;
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  // User-specific storage keys
  static String get usersKey => _usersKey;
  static String get currentUserKey => _currentUserKey;
  static String get isLoggedInKey => _isLoggedInKey;
}
