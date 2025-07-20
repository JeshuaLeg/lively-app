// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AchievementModelImpl _$$AchievementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AchievementModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$AchievementTypeEnumMap, json['type']),
      rarity: $enumDecode(_$AchievementRarityEnumMap, json['rarity']),
      iconPath: json['iconPath'] as String,
      requiredValue: (json['requiredValue'] as num).toInt(),
      currentValue: (json['currentValue'] as num?)?.toInt() ?? 0,
      isUnlocked: json['isUnlocked'] as bool? ?? false,
      unlockedAt: json['unlockedAt'] == null
          ? null
          : DateTime.parse(json['unlockedAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      isHidden: json['isHidden'] as bool? ?? false,
      isLimited: json['isLimited'] as bool? ?? false,
      points: (json['points'] as num?)?.toInt() ?? 0,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AchievementModelImplToJson(
        _$AchievementModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$AchievementTypeEnumMap[instance.type]!,
      'rarity': _$AchievementRarityEnumMap[instance.rarity]!,
      'iconPath': instance.iconPath,
      'requiredValue': instance.requiredValue,
      'currentValue': instance.currentValue,
      'isUnlocked': instance.isUnlocked,
      'unlockedAt': instance.unlockedAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'isHidden': instance.isHidden,
      'isLimited': instance.isLimited,
      'points': instance.points,
      'tags': instance.tags,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$AchievementTypeEnumMap = {
  AchievementType.streak: 'streak',
  AchievementType.focusTime: 'focusTime',
  AchievementType.sessionCount: 'sessionCount',
  AchievementType.milestone: 'milestone',
  AchievementType.social: 'social',
  AchievementType.seasonal: 'seasonal',
  AchievementType.special: 'special',
};

const _$AchievementRarityEnumMap = {
  AchievementRarity.common: 'common',
  AchievementRarity.rare: 'rare',
  AchievementRarity.epic: 'epic',
  AchievementRarity.legendary: 'legendary',
};

_$UserAchievementModelImpl _$$UserAchievementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAchievementModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      achievementId: json['achievementId'] as String,
      achievement: AchievementModel.fromJson(
          json['achievement'] as Map<String, dynamic>),
      currentProgress: (json['currentProgress'] as num?)?.toInt() ?? 0,
      isUnlocked: json['isUnlocked'] as bool? ?? false,
      unlockedAt: json['unlockedAt'] == null
          ? null
          : DateTime.parse(json['unlockedAt'] as String),
      isNotified: json['isNotified'] as bool? ?? false,
      progressData: json['progressData'] as Map<String, dynamic>? ?? const {},
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserAchievementModelImplToJson(
        _$UserAchievementModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'achievementId': instance.achievementId,
      'achievement': instance.achievement,
      'currentProgress': instance.currentProgress,
      'isUnlocked': instance.isUnlocked,
      'unlockedAt': instance.unlockedAt?.toIso8601String(),
      'isNotified': instance.isNotified,
      'progressData': instance.progressData,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
