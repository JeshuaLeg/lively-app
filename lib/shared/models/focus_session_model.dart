import 'package:freezed_annotation/freezed_annotation.dart';

part 'focus_session_model.freezed.dart';
part 'focus_session_model.g.dart';

enum SessionType {
  timer,
  scheduled,
  deepFocus
}

enum SessionStatus {
  pending,
  active,
  paused,
  completed,
  cancelled
}

enum DifficultyLevel {
  normal,
  timeout,
  deepFocus
}

@freezed
class FocusSessionModel with _$FocusSessionModel {
  const FocusSessionModel._();
  
  const factory FocusSessionModel({
    required String id,
    required String userId,
    required String title,
    String? description,
    required SessionType type,
    required SessionStatus status,
    required DifficultyLevel difficulty,
    required int duration, // in minutes
    @Default(0) int focusedTime, // in minutes
    @Default(0) int breakTime, // in minutes
    @Default([]) List<String> blockedApps,
    @Default([]) List<String> allowedApps,
    @Default([]) List<String> categories,
    @Default(false) bool isRecurring,
    @Default(null) Map<String, dynamic>? recurringSettings,
    @Default(null) DateTime? scheduledStartTime,
    @Default(null) DateTime? scheduledEndTime,
    @Default(null) DateTime? actualStartTime,
    @Default(null) DateTime? actualEndTime,
    @Default(null) DateTime? pausedAt,
    @Default(0) int pauseCount,
    @Default(0) int totalPauseTime, // in minutes
    @Default([]) List<String> distractionAttempts,
    @Default(0) int focusScore, // 0-100
    @Default(null) String? completionNote,
    @Default({}) Map<String, dynamic> metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _FocusSessionModel;

  factory FocusSessionModel.fromJson(Map<String, dynamic> json) => _$FocusSessionModelFromJson(json);
  
  // Helper methods
  bool get isActive => status == SessionStatus.active;
  bool get isCompleted => status == SessionStatus.completed;
  bool get isPaused => status == SessionStatus.paused;
  bool get canPause => difficulty != DifficultyLevel.deepFocus && isActive;
  bool get canCancel => difficulty != DifficultyLevel.deepFocus;
  
  double get completionPercentage => duration > 0 ? (focusedTime / duration).clamp(0.0, 1.0) : 0.0;
  int get remainingTime => duration - focusedTime;
  
  Duration get actualDuration => actualEndTime != null && actualStartTime != null
      ? actualEndTime!.difference(actualStartTime!)
      : Duration.zero;
      
  bool get isOverdue => scheduledEndTime != null && DateTime.now().isAfter(scheduledEndTime!);
  
  // Calculate focus effectiveness
  double get focusEffectiveness {
    if (actualDuration.inMinutes == 0) return 0.0;
    return (focusedTime / actualDuration.inMinutes).clamp(0.0, 1.0);
  }
}