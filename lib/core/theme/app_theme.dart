import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Opal-inspired Color Palette
  static const Color primaryNavy = Color(0xFF0A0E27);
  static const Color secondaryNavy = Color(0xFF1A1D3A);
  static const Color accentBlue = Color(0xFF2E3A59);
  static const Color gemBlue = Color(0xFF4FC3F7);
  static const Color gemTeal = Color(0xFF26C6DA);
  static const Color gemPurple = Color(0xFF7C4DFF);
  static const Color gemPink = Color(0xFFE91E63);
  static const Color gemGreen = Color(0xFF66BB6A);
  static const Color gemOrange = Color(0xFFFF7043);
  static const Color softWhite = Color(0xFFF8F9FA);
  static const Color mutedGray = Color(0xFF8E8E93);
  static const Color cardBackground = Color(0xFF1E2139);
  static const Color surfaceColor = Color(0xFF252847);

  // Legacy colors for backward compatibility
  static const Color primaryColor = gemBlue;
  static const Color secondaryColor = gemTeal;

  // Gradient Definitions
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryNavy, secondaryNavy],
  );

  static const LinearGradient gemGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gemBlue, gemTeal],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [cardBackground, surfaceColor],
  );

  static const LinearGradient focusGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF1A237E),
      Color(0xFF3949AB),
      Color(0xFF5C6BC0),
    ],
  );

  // Text Styles
  static TextTheme _textTheme = GoogleFonts.interTextTheme().copyWith(
    headlineLarge: GoogleFonts.inter(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: softWhite,
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: softWhite,
    ),
    headlineSmall: GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: softWhite,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: softWhite,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: softWhite,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: softWhite,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: softWhite,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: softWhite,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: mutedGray,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: softWhite,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: mutedGray,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: mutedGray,
    ),
  );

  // Dark Theme (Primary Theme)
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: _textTheme,
    scaffoldBackgroundColor: primaryNavy,
    
    colorScheme: const ColorScheme.dark(
      primary: gemBlue,
      secondary: gemTeal,
      surface: cardBackground,
      background: primaryNavy,
      onPrimary: softWhite,
      onSecondary: softWhite,
      onSurface: softWhite,
      onBackground: softWhite,
      tertiary: gemPurple,
      outline: mutedGray,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: softWhite,
      ),
      iconTheme: const IconThemeData(color: softWhite),
    ),

    cardTheme: CardTheme(
      color: cardBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: gemBlue,
        foregroundColor: softWhite,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: gemBlue,
        side: const BorderSide(color: gemBlue, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: gemBlue,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: secondaryNavy,
      selectedItemColor: gemBlue,
      unselectedItemColor: mutedGray,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: cardBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: mutedGray, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: gemBlue, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: gemPink, width: 1),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      hintStyle: const TextStyle(color: mutedGray),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return gemBlue;
        }
        return mutedGray;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return gemBlue.withOpacity(0.3);
        }
        return mutedGray.withOpacity(0.3);
      }),
    ),

    sliderTheme: const SliderThemeData(
      activeTrackColor: gemBlue,
      inactiveTrackColor: mutedGray,
      thumbColor: gemBlue,
      overlayColor: Color(0x1F4FC3F7),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: gemBlue,
      linearTrackColor: mutedGray,
      circularTrackColor: mutedGray,
    ),

    chipTheme: ChipThemeData(
      backgroundColor: cardBackground,
      selectedColor: gemBlue,
      disabledColor: mutedGray,
      labelStyle: const TextStyle(color: softWhite),
      selectedLabelStyle: const TextStyle(color: softWhite),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),

    tabBarTheme: const TabBarTheme(
      labelColor: gemBlue,
      unselectedLabelColor: mutedGray,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: gemBlue, width: 2),
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: mutedGray,
      thickness: 0.5,
    ),

    iconTheme: const IconThemeData(
      color: softWhite,
      size: 24,
    ),
  );

  // Light Theme (for compatibility)
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: GoogleFonts.interTextTheme().copyWith(
      headlineLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: primaryNavy,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: primaryNavy,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: primaryNavy,
      ),
    ),
    scaffoldBackgroundColor: softWhite,
    
    colorScheme: const ColorScheme.light(
      primary: gemBlue,
      secondary: gemTeal,
      surface: Colors.white,
      background: softWhite,
      onPrimary: softWhite,
      onSecondary: softWhite,
      onSurface: primaryNavy,
      onBackground: primaryNavy,
      tertiary: gemPurple,
      outline: mutedGray,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: softWhite,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: primaryNavy,
      ),
      iconTheme: const IconThemeData(color: primaryNavy),
    ),

    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 2,
      shadowColor: primaryNavy.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
    ),
  );

  // Custom Decoration Helpers
  static BoxDecoration get primaryGradientDecoration => const BoxDecoration(
    gradient: primaryGradient,
  );

  static BoxDecoration get cardGradientDecoration => BoxDecoration(
    gradient: cardGradient,
    borderRadius: BorderRadius.circular(16),
  );

  static BoxDecoration get gemGradientDecoration => BoxDecoration(
    gradient: gemGradient,
    borderRadius: BorderRadius.circular(16),
  );

  static BoxDecoration get focusGradientDecoration => BoxDecoration(
    gradient: focusGradient,
    borderRadius: BorderRadius.circular(16),
  );

  // Gem Colors for Achievement System
  static const List<Color> gemColors = [
    gemBlue,
    gemTeal,
    gemPurple,
    gemPink,
    gemGreen,
    gemOrange,
    Color(0xFFFFEB3B), // Yellow
    Color(0xFF9C27B0), // Deep Purple
    Color(0xFF00BCD4), // Cyan
    Color(0xFFFF5722), // Deep Orange
  ];

  // Shadow Definitions
  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: primaryNavy.withOpacity(0.3),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> get gemShadow => [
    BoxShadow(
      color: gemBlue.withOpacity(0.3),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
  ];

  // Animation Durations
  static const Duration shortDuration = Duration(milliseconds: 200);
  static const Duration mediumDuration = Duration(milliseconds: 300);
  static const Duration longDuration = Duration(milliseconds: 500);

  // Spacing Constants
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;

  // Border Radius Constants
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 24.0;
  static const double radiusXXL = 32.0;
}