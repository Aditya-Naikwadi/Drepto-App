import 'package:flutter/material.dart';

/// Enhanced color system with gradients and glassmorphism
class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF00897B);
  static const Color primaryDark = Color(0xFF00695C);
  static const Color primaryLight = Color(0xFF4DB6AC);
  
  // Accent Colors
  static const Color accent = Color(0xFFFF6F00);
  static const Color accentDark = Color(0xFFE65100);
  static const Color accentLight = Color(0xFFFF9800);
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF00897B), Color(0xFF26C6DA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFFF6F00), Color(0xFFFF5722)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient successGradient = LinearGradient(
    colors: [Color(0xFF66BB6A), Color(0xFF43A047)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient warningGradient = LinearGradient(
    colors: [Color(0xFFFFA726), Color(0xFFFB8C00)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient errorGradient = LinearGradient(
    colors: [Color(0xFFEF5350), Color(0xFFE53935)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient infoGradient = LinearGradient(
    colors: [Color(0xFF42A5F5), Color(0xFF1E88E5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Glassmorphism gradients
  static LinearGradient glassGradient = LinearGradient(
    colors: [
      Colors.white.withOpacity(0.7),
      Colors.white.withOpacity(0.3),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static LinearGradient darkGlassGradient = LinearGradient(
    colors: [
      Colors.black.withOpacity(0.3),
      Colors.black.withOpacity(0.1),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Semantic Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFA726);
  static const Color error = Color(0xFFEF5350);
  static const Color info = Color(0xFF42A5F5);
  
  // Background Colors
  static const Color backgroundLight = Color(0xFFF5F7FA);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  static const Color textDisabled = Color(0xFFE0E0E0);
  
  // Border Colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderDark = Color(0xFF424242);
  
  // Interactive State Colors
  static const Color hover = Color(0xFFF5F5F5);
  static const Color pressed = Color(0xFFEEEEEE);
  static const Color disabled = Color(0xFFBDBDBD);
  
  // Shadows
  static List<BoxShadow> shadowSmall = [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];
  
  static List<BoxShadow> shadowMedium = [
    BoxShadow(
      color: Colors.black.withOpacity(0.12),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];
  
  static List<BoxShadow> shadowLarge = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];
  
  static List<BoxShadow> shadowXLarge = [
    BoxShadow(
      color: Colors.black.withOpacity(0.20),
      blurRadius: 48,
      offset: const Offset(0, 16),
    ),
  ];
  
  // Colored shadows for elevation
  static List<BoxShadow> primaryShadow = [
    BoxShadow(
      color: primary.withOpacity(0.3),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];
  
  static List<BoxShadow> accentShadow = [
    BoxShadow(
      color: accent.withOpacity(0.3),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];
  
  // Service-specific colors
  static const Color doctorColor = Color(0xFF2196F3);
  static const Color labTestColor = Color(0xFF9C27B0);
  static const Color pharmacyColor = Color(0xFF4CAF50);
  static const Color nurseColor = Color(0xFFE91E63);
  static const Color storeColor = Color(0xFFFF9800);
  static const Color premiumColor = Color(0xFFFFD700);
  static const Color ambulanceColor = Color(0xFFF44336);
  static const Color profileColor = Color(0xFF607D8B);
  
  // Service gradients
  static const LinearGradient doctorGradient = LinearGradient(
    colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient labTestGradient = LinearGradient(
    colors: [Color(0xFF9C27B0), Color(0xFF7B1FA2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient pharmacyGradient = LinearGradient(
    colors: [Color(0xFF4CAF50), Color(0xFF388E3C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient nurseGradient = LinearGradient(
    colors: [Color(0xFFE91E63), Color(0xFFC2185B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient storeGradient = LinearGradient(
    colors: [Color(0xFFFF9800), Color(0xFFF57C00)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient premiumGradient = LinearGradient(
    colors: [Color(0xFFFFD700), Color(0xFFFFA000)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient ambulanceGradient = LinearGradient(
    colors: [Color(0xFFF44336), Color(0xFFD32F2F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
