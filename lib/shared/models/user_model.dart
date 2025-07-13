import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    String? displayName,
    String? photoUrl,
    String? phoneNumber,
    @Default(false) bool isEmailVerified,
    @Default(false) bool isOnboardingCompleted,
    @Default(false) bool isPremium,
    @Default(0) int totalFocusTime, // in minutes
    @Default(0) int totalSessions,
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
    @Default(120) int dailyGoal, // in minutes
    @Default(840) int weeklyGoal, // in minutes
    @Default([]) List<String> blockedApps,
    @Default([]) List<String> allowedApps,
    @Default([]) List<String> friends,
    @Default([]) List<String> achievements,
    @Default('light') String themeMode,
    @Default(true) bool notificationsEnabled,
    @Default(true) bool soundEnabled,
    @Default(true) bool vibrationEnabled,
    @Default('normal') String defaultDifficulty,
    @Default(25) int defaultSessionDuration, // in minutes
    @Default(5) int shortBreakDuration, // in minutes
    @Default(15) int longBreakDuration, // in minutes
    @Default(null) DateTime? lastActiveDate,
    @Default(null) DateTime? premiumExpiryDate,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  
  // Helper methods
  bool get isActive => lastActiveDate?.isAfter(DateTime.now().subtract(const Duration(days: 1))) ?? false;
  bool get hasPremium => isPremium && (premiumExpiryDate?.isAfter(DateTime.now()) ?? false);
  double get dailyProgress => dailyGoal > 0 ? (totalFocusTime / dailyGoal).clamp(0.0, 1.0) : 0.0;
  
  // Level calculation based on total focus time
  int get level => (totalFocusTime / 60).floor() + 1; // 1 level per hour
  int get nextLevelProgress => totalFocusTime % 60;
  int get nextLevelRequirement => 60;
}