import '../models/user_model.dart';
import 'storage_service.dart';

class AuthService {
  // Register a new user
  static Future<Map<String, dynamic>> register(UserModel user) async {
    try {
      // Get existing users
      final users = await _getAllUsers();

      // Check if email already exists
      final emailExists = users.any((u) => u.email == user.email);
      if (emailExists) {
        return {
          'success': false,
          'message': 'Email already registered',
        };
      }

      // Add new user to list
      users.add(user);

      // Save updated users list
      final userJsonList = users.map((u) => u.toJsonString()).toList();
      await StorageService.saveStringList(StorageService.usersKey, userJsonList);

      return {
        'success': true,
        'message': 'Registration successful',
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Registration failed: ${e.toString()}',
      };
    }
  }

  // Login user
  static Future<Map<String, dynamic>> login(
    String email,
    String password,
    String role,
  ) async {
    try {
      // Get all users
      final users = await _getAllUsers();

      // Find user with matching credentials
      final user = users.firstWhere(
        (u) => u.email == email && u.password == password && u.role == role,
        orElse: () => throw Exception('Invalid credentials'),
      );

      // Save current user and login status
      await StorageService.saveString(
        StorageService.currentUserKey,
        user.toJsonString(),
      );
      await StorageService.saveBool(StorageService.isLoggedInKey, true);

      return {
        'success': true,
        'message': 'Login successful',
        'user': user,
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Invalid credentials or role mismatch',
      };
    }
  }

  // Logout user
  static Future<void> logout() async {
    await StorageService.remove(StorageService.currentUserKey);
    await StorageService.saveBool(StorageService.isLoggedInKey, false);
  }

  // Get current logged-in user
  static Future<UserModel?> getCurrentUser() async {
    try {
      final userJson = await StorageService.getString(StorageService.currentUserKey);
      if (userJson == null) return null;
      return UserModel.fromJsonString(userJson);
    } catch (e) {
      return null;
    }
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    return await StorageService.getBool(StorageService.isLoggedInKey);
  }

  // Get all users (private helper method)
  static Future<List<UserModel>> _getAllUsers() async {
    try {
      final userJsonList = await StorageService.getStringList(StorageService.usersKey);
      return userJsonList.map((json) => UserModel.fromJsonString(json)).toList();
    } catch (e) {
      return [];
    }
  }
}
