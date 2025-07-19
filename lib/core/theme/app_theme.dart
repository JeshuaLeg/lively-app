import 'package:flutter/material.dart';

class AppTheme {
  // Lively Colors (matching Opal design)
  static const Color primaryBlue = Color(0xFF4FAAFF);
  static const Color primaryPurple = Color(0xFF6C5CE7);
  static const Color primaryTeal = Color(0xFF00D4AA);
  static const Color gemGold = Color(0xFFFFD700);
  
  // Background Colors
  static const Color darkBackground = Color(0xFF0A0A12);
  static const Color cardBackground = Color(0xFF1A1B2E);
  static const Color surfaceColor = Color(0xFF2A2B3E);
  
  // Text Colors
  static const Color primaryText = Color(0xFFFFFFFF);
  static const Color secondaryText = Color(0xFFB0B0B0);
  static const Color mutedText = Color(0xFF6B7280);
  
  // Status Colors
  static const Color successGreen = Color(0xFF00D4AA);
  static const Color warningOrange = Color(0xFFFF9500);
  static const Color errorRed = Color(0xFFFF6B6B);
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4FAAFF), Color(0xFF6C5CE7)],
  );
  
  static const LinearGradient gemGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
  );
  
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF0A0A12), Color(0xFF1A1B2E)],
  );

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryBlue,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: primaryBlue,
        secondary: primaryTeal,
        surface: cardBackground,
        background: darkBackground,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: primaryText,
        onBackground: primaryText,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: primaryText,
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardTheme(
        color: cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: primaryText, fontSize: 32, fontWeight: FontWeight.w700),
        displayMedium: TextStyle(color: primaryText, fontSize: 28, fontWeight: FontWeight.w600),
        displaySmall: TextStyle(color: primaryText, fontSize: 24, fontWeight: FontWeight.w600),
        headlineLarge: TextStyle(color: primaryText, fontSize: 22, fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(color: primaryText, fontSize: 20, fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(color: primaryText, fontSize: 18, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(color: primaryText, fontSize: 16, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(color: primaryText, fontSize: 14, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(color: primaryText, fontSize: 12, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(color: primaryText, fontSize: 16, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(color: primaryText, fontSize: 14, fontWeight: FontWeight.w400),
        bodySmall: TextStyle(color: secondaryText, fontSize: 12, fontWeight: FontWeight.w400),
        labelLarge: TextStyle(color: primaryText, fontSize: 14, fontWeight: FontWeight.w500),
        labelMedium: TextStyle(color: secondaryText, fontSize: 12, fontWeight: FontWeight.w500),
        labelSmall: TextStyle(color: mutedText, fontSize: 11, fontWeight: FontWeight.w500),
      ),
    );
  }
}