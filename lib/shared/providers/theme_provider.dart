import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_constants.dart';

// Theme Mode State Notifier
class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.dark) {  // Default to dark mode to match Opal
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(AppConstants.themeKey) ?? 'dark';  // Default to dark
    
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
        state = ThemeMode.dark;  // Default to dark
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
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
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

// Theme Extensions for easier access in widgets
extension WidgetRefThemeExtension on WidgetRef {
  bool get isDarkMode => watch(isDarkModeProvider);
  String get currentThemeString => watch(currentThemeStringProvider);
  ThemeMode get themeMode => watch(themeModeProvider);
}

extension BuildContextThemeExtension on BuildContext {
  bool get isDarkMode {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark;
  }
  
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

// Color Preference Providers for customization
class ColorPreferencesNotifier extends StateNotifier<Map<String, Color>> {
  ColorPreferencesNotifier() : super({});

  Future<void> setAccentColor(Color color) async {
    state = {...state, 'accent': color};
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('accent_color', color.value);
  }

  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final accentValue = prefs.getInt('accent_color');
    
    if (accentValue != null) {
      state = {...state, 'accent': Color(accentValue)};
    }
  }
}

final colorPreferencesProvider = StateNotifierProvider<ColorPreferencesNotifier, Map<String, Color>>((ref) {
  final notifier = ColorPreferencesNotifier();
  notifier.loadPreferences();
  return notifier;
});

// Adaptive Color Providers
final adaptiveColorProvider = Provider.family<Color, String>((ref, colorKey) {
  final isDark = ref.watch(isDarkModeProvider);
  final preferences = ref.watch(colorPreferencesProvider);
  
  // Return custom color if set, otherwise return theme defaults
  if (preferences.containsKey(colorKey)) {
    return preferences[colorKey]!;
  }
  
  // Return default theme colors based on current mode
  switch (colorKey) {
    case 'primary':
      return isDark ? const Color(0xFF4FC3F7) : const Color(0xFF1976D2);
    case 'surface':
      return isDark ? const Color(0xFF1E2139) : const Color(0xFFFFFFFF);
    case 'background':
      return isDark ? const Color(0xFF0A0E27) : const Color(0xFFF8F9FA);
    default:
      return isDark ? const Color(0xFF4FC3F7) : const Color(0xFF1976D2);
  }
});

// Focus Mode Theme Provider
class FocusModeNotifier extends StateNotifier<bool> {
  FocusModeNotifier() : super(false);

  void enableFocusMode() {
    state = true;
  }

  void disableFocusMode() {
    state = false;
  }

  void toggleFocusMode() {
    state = !state;
  }
}

final focusModeProvider = StateNotifierProvider<FocusModeNotifier, bool>((ref) {
  return FocusModeNotifier();
});

// Theme Constants for quick access
class ThemeConstants {
  static const double cardElevation = 0.0;
  static const double buttonElevation = 0.0;
  static const double modalElevation = 8.0;
  
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);
  
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusXLarge = 24.0;
  
  static const EdgeInsets paddingSmall = EdgeInsets.all(8.0);
  static const EdgeInsets paddingMedium = EdgeInsets.all(16.0);
  static const EdgeInsets paddingLarge = EdgeInsets.all(24.0);
  
  static const EdgeInsets marginSmall = EdgeInsets.all(4.0);
  static const EdgeInsets marginMedium = EdgeInsets.all(8.0);
  static const EdgeInsets marginLarge = EdgeInsets.all(16.0);
}