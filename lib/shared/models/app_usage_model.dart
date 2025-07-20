import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_usage_model.freezed.dart';
part 'app_usage_model.g.dart';

@freezed
class AppUsageModel with _$AppUsageModel {
  const AppUsageModel._();
  
  const factory AppUsageModel({
    required String id,
    required String userId,
    required String appName,
    required String packageName,
    String? appIcon,
    required String category,
    required DateTime date,
    @Default(0) int timeSpent, // in minutes
    @Default(0) int openCount,
    @Default(0) int notificationCount,
    @Default(0) int blockCount,
    @Default(0) int focusScore, // 0-100
    @Default(false) bool isDistraction,
    @Default(false) bool isProductivity,
    @Default([]) List<UsageSession> sessions,
    @Default({}) Map<String, dynamic> metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AppUsageModel;

  factory AppUsageModel.fromJson(Map<String, dynamic> json) => _$AppUsageModelFromJson(json);
  
  // Helper methods
  double get averageSessionDuration => sessions.isNotEmpty 
      ? sessions.fold<int>(0, (sum, session) => sum + session.duration) / sessions.length
      : 0.0;
      
  int get totalSessionTime => sessions.fold<int>(0, (sum, session) => sum + session.duration);
  
  bool get isOverused => timeSpent > 120; // More than 2 hours
  bool get isFrequentlyUsed => openCount > 50;
  
  // Calculate productivity score
  double get productivityScore {
    if (isProductivity) return 1.0;
    if (isDistraction) return 0.0;
    return 0.5; // Neutral
  }
}

@freezed
class UsageSession with _$UsageSession {
  const factory UsageSession({
    required DateTime startTime,
    required DateTime endTime,
    required int duration, // in minutes
    @Default(false) bool wasBlocked,
    @Default(null) String? blockReason,
  }) = _UsageSession;

  factory UsageSession.fromJson(Map<String, dynamic> json) => _$UsageSessionFromJson(json);
}

@freezed
class DailyUsageStats with _$DailyUsageStats {
  const DailyUsageStats._();
  
  const factory DailyUsageStats({
    required DateTime date,
    required String userId,
    @Default(0) int totalScreenTime, // in minutes
    @Default(0) int totalFocusTime, // in minutes
    @Default(0) int totalDistractedTime, // in minutes
    @Default(0) int totalProductiveTime, // in minutes
    @Default(0) int totalAppsUsed,
    @Default(0) int totalNotifications,
    @Default(0) int totalBlockedAttempts,
    @Default(0) int totalFocusSessions,
    @Default(0) int completedFocusSessions,
    @Default(0) double averageFocusScore,
    @Default([]) List<AppUsageModel> appUsages,
    @Default({}) Map<String, int> categoryUsage,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DailyUsageStats;

  factory DailyUsageStats.fromJson(Map<String, dynamic> json) => _$DailyUsageStatsFromJson(json);
  
  // Helper methods
  double get focusRatio => totalScreenTime > 0 ? (totalFocusTime / totalScreenTime).clamp(0.0, 1.0) : 0.0;
  double get distractionRatio => totalScreenTime > 0 ? (totalDistractedTime / totalScreenTime).clamp(0.0, 1.0) : 0.0;
  double get productivityRatio => totalScreenTime > 0 ? (totalProductiveTime / totalScreenTime).clamp(0.0, 1.0) : 0.0;
  double get sessionCompletionRate => totalFocusSessions > 0 ? (completedFocusSessions / totalFocusSessions).clamp(0.0, 1.0) : 0.0;
  
  // Get most used apps
  List<AppUsageModel> get mostUsedApps {
    final sorted = List<AppUsageModel>.from(appUsages)
      ..sort((a, b) => b.timeSpent.compareTo(a.timeSpent));
    return sorted.take(5).toList();
  }
  
  // Get most distracting apps
  List<AppUsageModel> get mostDistractingApps {
    final distractingApps = appUsages.where((app) => app.isDistraction).toList()
      ..sort((a, b) => b.timeSpent.compareTo(a.timeSpent));
    return distractingApps.take(5).toList();
  }
}