import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF4CAF50);
  static const Color primaryLight = Color(0xFF81C784);
  static const Color primaryDark = Color(0xFF388E3C);

  // Secondary Colors
  static const Color secondary = Color(0xFFFF9800);
  static const Color secondaryLight = Color(0xFFFFB74D);
  static const Color secondaryDark = Color(0xFFF57C00);

  // Background Colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color card = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Color(0xFFBDBDBD);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroGradient = LinearGradient(
    colors: [Color(0xFF4CAF50), Color(0xFF81C784), Color(0xFFA5D6A7)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Category Colors
  static const Color groceryColor = Color(0xFF66BB6A);
  static const Color vegetableColor = Color(0xFF43A047);
  static const Color fruitColor = Color(0xFFFFB74D);
  static const Color dairyColor = Color(0xFF42A5F5);
  static const Color electricianColor = Color(0xFFFFCA28);
  static const Color plumberColor = Color(0xFF29B6F6);
  static const Color carpenterColor = Color(0xFF8D6E63);
  static const Color cleaningColor = Color(0xFF26C6DA);
}
