import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement_model.freezed.dart';
part 'achievement_model.g.dart';

enum AchievementType {
  streak,
  focusTime,
  sessionCount,
  milestone,
  social,
  seasonal,
  special
}

enum AchievementRarity {
  common,
  rare,
  epic,
  legendary
}

@freezed
class AchievementModel with _$AchievementModel {
  const AchievementModel._();
  
  const factory AchievementModel({
    required String id,
    required String title,
    required String description,
    required AchievementType type,
    required AchievementRarity rarity,
    required String iconPath,
    required int requiredValue,
    @Default(0) int currentValue,
    @Default(false) bool isUnlocked,
    @Default(null) DateTime? unlockedAt,
    @Default(null) DateTime? expiresAt,
    @Default(false) bool isHidden,
    @Default(false) bool isLimited,
    @Default(0) int points,
    @Default([]) List<String> tags,
    @Default({}) Map<String, dynamic> metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AchievementModel;

  factory AchievementModel.fromJson(Map<String, dynamic> json) => _$AchievementModelFromJson(json);
  
  // Helper methods
  double get progress => requiredValue > 0 ? (currentValue / requiredValue).clamp(0.0, 1.0) : 0.0;
  bool get isCompleted => currentValue >= requiredValue;
  bool get isExpired => expiresAt != null && DateTime.now().isAfter(expiresAt!);
  bool get isAvailable => !isExpired && !isHidden;
  
  // Get color based on rarity
  int get rarityColor {
    switch (rarity) {
      case AchievementRarity.common:
        return 0xFF95A5A6;
      case AchievementRarity.rare:
        return 0xFF3498DB;
      case AchievementRarity.epic:
        return 0xFF9B59B6;
      case AchievementRarity.legendary:
        return 0xFFF39C12;
    }
  }
  
  // Get gem name based on type
  String get gemName {
    switch (type) {
      case AchievementType.streak:
        return 'Streak Gem';
      case AchievementType.focusTime:
        return 'Focus Gem';
      case AchievementType.sessionCount:
        return 'Session Gem';
      case AchievementType.milestone:
        return 'Milestone Gem';
      case AchievementType.social:
        return 'Social Gem';
      case AchievementType.seasonal:
        return 'Seasonal Gem';
      case AchievementType.special:
        return 'Special Gem';
    }
  }
}

@freezed
class UserAchievementModel with _$UserAchievementModel {
  const UserAchievementModel._();
  
  const factory UserAchievementModel({
    required String id,
    required String userId,
    required String achievementId,
    required AchievementModel achievement,
    @Default(0) int currentProgress,
    @Default(false) bool isUnlocked,
    @Default(null) DateTime? unlockedAt,
    @Default(false) bool isNotified,
    @Default({}) Map<String, dynamic> progressData,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserAchievementModel;

  factory UserAchievementModel.fromJson(Map<String, dynamic> json) => _$UserAchievementModelFromJson(json);
  
  // Helper methods
  double get progress => achievement.requiredValue > 0 
      ? (currentProgress / achievement.requiredValue).clamp(0.0, 1.0) 
      : 0.0;
      
  bool get isCompleted => currentProgress >= achievement.requiredValue;
  bool get canUnlock => isCompleted && !isUnlocked;
  int get remainingProgress => achievement.requiredValue - currentProgress;
}

// Predefined achievements similar to Opal's gems
class DefaultAchievements {
  static const List<Map<String, dynamic>> achievements = [
    {
      'id': 'first_gem',
      'title': 'First Gem',
      'description': 'You installed Lively',
      'type': AchievementType.special,
      'rarity': AchievementRarity.common,
      'iconPath': 'assets/icons/gems/first_gem.png',
      'requiredValue': 1,
      'points': 10,
      'tags': ['installation', 'welcome'],
    },
    {
      'id': 'motivated_gem',
      'title': 'Motivated Gem',
      'description': 'Use Lively for 2 Days',
      'type': AchievementType.streak,
      'rarity': AchievementRarity.common,
      'iconPath': 'assets/icons/gems/motivated_gem.png',
      'requiredValue': 2,
      'points': 20,
      'tags': ['daily', 'streak'],
    },
    {
      'id': 'driven_gem',
      'title': 'Driven Gem',
      'description': 'Focus for 10 hours',
      'type': AchievementType.focusTime,
      'rarity': AchievementRarity.common,
      'iconPath': 'assets/icons/gems/driven_gem.png',
      'requiredValue': 600, // 10 hours in minutes
      'points': 50,
      'tags': ['focus', 'time'],
    },
    {
      'id': 'determined_gem',
      'title': 'Determined Gem',
      'description': 'Focus for 50 hours',
      'type': AchievementType.focusTime,
      'rarity': AchievementRarity.rare,
      'iconPath': 'assets/icons/gems/determined_gem.png',
      'requiredValue': 3000, // 50 hours in minutes
      'points': 100,
      'tags': ['focus', 'time'],
    },
    {
      'id': 'diligent_gem',
      'title': 'Diligent Gem',
      'description': 'Focus for 100 hours',
      'type': AchievementType.focusTime,
      'rarity': AchievementRarity.epic,
      'iconPath': 'assets/icons/gems/diligent_gem.png',
      'requiredValue': 6000, // 100 hours in minutes
      'points': 200,
      'tags': ['focus', 'time'],
    },
    {
      'id': 'dutiful_gem',
      'title': 'Dutiful Gem',
      'description': 'Focus for 500 hours',
      'type': AchievementType.focusTime,
      'rarity': AchievementRarity.legendary,
      'iconPath': 'assets/icons/gems/dutiful_gem.png',
      'requiredValue': 30000, // 500 hours in minutes
      'points': 500,
      'tags': ['focus', 'time'],
    },
    {
      'id': 'devoted_gem',
      'title': 'Devoted Gem',
      'description': 'Focus for 1,000 hours',
      'type': AchievementType.focusTime,
      'rarity': AchievementRarity.legendary,
      'iconPath': 'assets/icons/gems/devoted_gem.png',
      'requiredValue': 60000, // 1000 hours in minutes
      'points': 1000,
      'tags': ['focus', 'time'],
    },
    {
      'id': 'committed_gem',
      'title': 'Committed Gem',
      'description': 'Use Lively for 5 Days',
      'type': AchievementType.streak,
      'rarity': AchievementRarity.common,
      'iconPath': 'assets/icons/gems/committed_gem.png',
      'requiredValue': 5,
      'points': 30,
      'tags': ['daily', 'streak'],
    },
    {
      'id': 'balanced_gem',
      'title': 'Balanced Gem',
      'description': 'Use Lively for 10 Days',
      'type': AchievementType.streak,
      'rarity': AchievementRarity.rare,
      'iconPath': 'assets/icons/gems/balanced_gem.png',
      'requiredValue': 10,
      'points': 50,
      'tags': ['daily', 'streak'],
    },
    {
      'id': 'loyal_gem',
      'title': 'Loyal Gem',
      'description': 'Invite 1 Friend',
      'type': AchievementType.social,
      'rarity': AchievementRarity.common,
      'iconPath': 'assets/icons/gems/loyal_gem.png',
      'requiredValue': 1,
      'points': 25,
      'tags': ['social', 'invite'],
    },
    {
      'id': 'soulful_gem',
      'title': 'Soulful Gem',
      'description': 'Invite 3 Friends',
      'type': AchievementType.social,
      'rarity': AchievementRarity.rare,
      'iconPath': 'assets/icons/gems/soulful_gem.png',
      'requiredValue': 3,
      'points': 75,
      'tags': ['social', 'invite'],
    },
    {
      'id': 'popular_gem',
      'title': 'Popular Gem',
      'description': 'Invite 10 Friends',
      'type': AchievementType.social,
      'rarity': AchievementRarity.epic,
      'iconPath': 'assets/icons/gems/popular_gem.png',
      'requiredValue': 10,
      'points': 200,
      'tags': ['social', 'invite'],
    },
    {
      'id': 'skilled_gem',
      'title': 'Skilled Gem',
      'description': 'Focus During Work',
      'type': AchievementType.milestone,
      'rarity': AchievementRarity.common,
      'iconPath': 'assets/icons/gems/skilled_gem.png',
      'requiredValue': 1,
      'points': 30,
      'tags': ['work', 'focus'],
    },
    {
      'id': 'unwavering_gem',
      'title': 'Unwavering Gem',
      'description': 'Get Lively Pro',
      'type': AchievementType.special,
      'rarity': AchievementRarity.epic,
      'iconPath': 'assets/icons/gems/unwavering_gem.png',
      'requiredValue': 1,
      'points': 100,
      'tags': ['premium', 'pro'],
    },
    {
      'id': 'original_gem',
      'title': 'Original Gem',
      'description': 'Early Adopter',
      'type': AchievementType.special,
      'rarity': AchievementRarity.legendary,
      'iconPath': 'assets/icons/gems/original_gem.png',
      'requiredValue': 1,
      'points': 500,
      'tags': ['early', 'adopter'],
    },
  ];
}