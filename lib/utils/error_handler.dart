import 'package:flutter/foundation.dart';

/// Centralized error handling utility
class ErrorHandler {
  /// Log error to console (debug mode) or analytics (production)
  static void logError(String message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      debugPrint('❌ ERROR: $message');
      if (error != null) {
        debugPrint('Details: $error');
      }
      if (stackTrace != null) {
        debugPrint('Stack trace: $stackTrace');
      }
    } else {
      // In production, send to analytics/crash reporting
      // Example: FirebaseCrashlytics.instance.recordError(error, stackTrace);
    }
  }

  /// Log warning
  static void logWarning(String message) {
    if (kDebugMode) {
      debugPrint('⚠️ WARNING: $message');
    }
  }

  /// Log info
  static void logInfo(String message) {
    if (kDebugMode) {
      debugPrint('ℹ️ INFO: $message');
    }
  }

  /// Get user-friendly error message
  static String getUserMessage(dynamic error) {
    if (error == null) {
      return 'An unexpected error occurred';
    }

    final errorString = error.toString().toLowerCase();

    if (errorString.contains('network') || errorString.contains('socket')) {
      return 'Network error. Please check your connection';
    }

    if (errorString.contains('timeout')) {
      return 'Request timed out. Please try again';
    }

    if (errorString.contains('permission')) {
      return 'Permission denied. Please check app permissions';
    }

    if (errorString.contains('not found') || errorString.contains('404')) {
      return 'Resource not found';
    }

    if (errorString.contains('unauthorized') || errorString.contains('401')) {
      return 'Unauthorized. Please login again';
    }

    if (errorString.contains('server') || errorString.contains('500')) {
      return 'Server error. Please try again later';
    }

    return 'An error occurred. Please try again';
  }
}

/// Custom exceptions
class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}

class StorageException implements Exception {
  final String message;
  StorageException(this.message);

  @override
  String toString() => message;
}

class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);

  @override
  String toString() => message;
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => message;
}
