import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_constants.dart';

// Theme Mode State Notifier
class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.light) {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(AppConstants.themeKey) ?? 'light';
    
    switch (themeString) {
      case 'light':
        state = ThemeMode.light;
        break;
      case 'dark':
        state = ThemeMode.dark;
        break;
      case 'system':
        state = ThemeMode.system;
        break;
      default:
        state = ThemeMode.light;
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    
    final prefs = await SharedPreferences.getInstance();
    String themeString;
    
    switch (mode) {
      case ThemeMode.light:
        themeString = 'light';
        break;
      case ThemeMode.dark:
        themeString = 'dark';
        break;
      case ThemeMode.system:
        themeString = 'system';
        break;
    }
    
    await prefs.setString(AppConstants.themeKey, themeString);
  }

  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await setThemeMode(newMode);
  }
}

// Theme Mode Provider
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});

// Helper Providers
final isDarkModeProvider = Provider<bool>((ref) {
  final themeMode = ref.watch(themeModeProvider);
  
  if (themeMode == ThemeMode.system) {
    // Get system brightness
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    return brightness == Brightness.dark;
  }
  
  return themeMode == ThemeMode.dark;
});

final currentThemeStringProvider = Provider<String>((ref) {
  final themeMode = ref.watch(themeModeProvider);
  
  switch (themeMode) {
    case ThemeMode.light:
      return 'Light';
    case ThemeMode.dark:
      return 'Dark';
    case ThemeMode.system:
      return 'System';
  }
});

// Theme Animation Provider
class ThemeAnimationNotifier extends StateNotifier<bool> {
  ThemeAnimationNotifier() : super(false);

  void startAnimation() {
    state = true;
  }

  void stopAnimation() {
    state = false;
  }
}

final themeAnimationProvider = StateNotifierProvider<ThemeAnimationNotifier, bool>((ref) {
  return ThemeAnimationNotifier();
});

// Theme Colors Provider
final themeColorsProvider = Provider<Map<String, Color>>((ref) {
  final isDark = ref.watch(isDarkModeProvider);
  
  if (isDark) {
    return {
      'primary': const Color(0xFF8B93FF),
      'secondary': const Color(0xFF9B59B6),
      'accent': const Color(0xFFFF6B9D),
      'background': const Color(0xFF1A1A1A),
      'surface': const Color(0xFF2D2D2D),
      'error': const Color(0xFFE74C3C),
      'success': const Color(0xFF2ECC71),
      'warning': const Color(0xFFF39C12),
      'textPrimary': const Color(0xFFECF0F1),
      'textSecondary': const Color(0xFFBDC3C7),
      'textTertiary': const Color(0xFF7F8C8D),
    };
  } else {
    return {
      'primary': const Color(0xFF6B73FF),
      'secondary': const Color(0xFF9B59B6),
      'accent': const Color(0xFFFF6B9D),
      'background': const Color(0xFFF8F9FA),
      'surface': const Color(0xFFFFFFFF),
      'error': const Color(0xFFE74C3C),
      'success': const Color(0xFF2ECC71),
      'warning': const Color(0xFFF39C12),
      'textPrimary': const Color(0xFF2C3E50),
      'textSecondary': const Color(0xFF7F8C8D),
      'textTertiary': const Color(0xFFBDC3C7),
    };
  }
});

// Pastel Colors Provider
final pastelColorsProvider = Provider<Map<String, Color>>((ref) {
  return {
    'lightPurple': const Color(0xFFF3F0FF),
    'lightBlue': const Color(0xFFE8F4FD),
    'lightPink': const Color(0xFFFFE8F1),
    'lightGreen': const Color(0xFFE8F5E8),
    'lightOrange': const Color(0xFFFFF2E8),
    'lightYellow': const Color(0xFFFFFBE8),
    'lightRed': const Color(0xFFFFE8E8),
    'lightGray': const Color(0xFFF5F5F5),
  };
});

// Gradient Provider
final gradientProvider = Provider<List<LinearGradient>>((ref) {
  return [
    const LinearGradient(
      colors: [Color(0xFF6B73FF), Color(0xFF9B59B6)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [Color(0xFF9B59B6), Color(0xFFFF6B9D)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [Color(0xFFFF6B9D), Color(0xFFF39C12)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [Color(0xFF2ECC71), Color(0xFF3498DB)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [Color(0xFF3498DB), Color(0xFF6B73FF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ];
});

// Theme Utility Functions
extension ThemeExtension on WidgetRef {
  ThemeMode get themeMode => watch(themeModeProvider);
  bool get isDarkMode => watch(isDarkModeProvider);
  Map<String, Color> get themeColors => watch(themeColorsProvider);
  Map<String, Color> get pastelColors => watch(pastelColorsProvider);
  List<LinearGradient> get gradients => watch(gradientProvider);
  
  Color getThemeColor(String colorName) {
    return themeColors[colorName] ?? Colors.grey;
  }
  
  Color getPastelColor(String colorName) {
    return pastelColors[colorName] ?? Colors.grey.shade100;
  }
  
  LinearGradient getGradient(int index) {
    return gradients[index % gradients.length];
  }
}