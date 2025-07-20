// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String?,
      photoUrl: json['photoUrl'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
      isOnboardingCompleted: json['isOnboardingCompleted'] as bool? ?? false,
      isPremium: json['isPremium'] as bool? ?? false,
      totalFocusTime: (json['totalFocusTime'] as num?)?.toInt() ?? 0,
      totalSessions: (json['totalSessions'] as num?)?.toInt() ?? 0,
      currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
      longestStreak: (json['longestStreak'] as num?)?.toInt() ?? 0,
      dailyGoal: (json['dailyGoal'] as num?)?.toInt() ?? 120,
      weeklyGoal: (json['weeklyGoal'] as num?)?.toInt() ?? 840,
      blockedApps: (json['blockedApps'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      allowedApps: (json['allowedApps'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      friends: (json['friends'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      achievements: (json['achievements'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      themeMode: json['themeMode'] as String? ?? 'light',
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
      soundEnabled: json['soundEnabled'] as bool? ?? true,
      vibrationEnabled: json['vibrationEnabled'] as bool? ?? true,
      defaultDifficulty: json['defaultDifficulty'] as String? ?? 'normal',
      defaultSessionDuration:
          (json['defaultSessionDuration'] as num?)?.toInt() ?? 25,
      shortBreakDuration: (json['shortBreakDuration'] as num?)?.toInt() ?? 5,
      longBreakDuration: (json['longBreakDuration'] as num?)?.toInt() ?? 15,
      lastActiveDate: json['lastActiveDate'] == null
          ? null
          : DateTime.parse(json['lastActiveDate'] as String),
      premiumExpiryDate: json['premiumExpiryDate'] == null
          ? null
          : DateTime.parse(json['premiumExpiryDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'phoneNumber': instance.phoneNumber,
      'isEmailVerified': instance.isEmailVerified,
      'isOnboardingCompleted': instance.isOnboardingCompleted,
      'isPremium': instance.isPremium,
      'totalFocusTime': instance.totalFocusTime,
      'totalSessions': instance.totalSessions,
      'currentStreak': instance.currentStreak,
      'longestStreak': instance.longestStreak,
      'dailyGoal': instance.dailyGoal,
      'weeklyGoal': instance.weeklyGoal,
      'blockedApps': instance.blockedApps,
      'allowedApps': instance.allowedApps,
      'friends': instance.friends,
      'achievements': instance.achievements,
      'themeMode': instance.themeMode,
      'notificationsEnabled': instance.notificationsEnabled,
      'soundEnabled': instance.soundEnabled,
      'vibrationEnabled': instance.vibrationEnabled,
      'defaultDifficulty': instance.defaultDifficulty,
      'defaultSessionDuration': instance.defaultSessionDuration,
      'shortBreakDuration': instance.shortBreakDuration,
      'longBreakDuration': instance.longBreakDuration,
      'lastActiveDate': instance.lastActiveDate?.toIso8601String(),
      'premiumExpiryDate': instance.premiumExpiryDate?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
