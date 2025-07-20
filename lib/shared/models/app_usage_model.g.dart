// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_usage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUsageModelImpl _$$AppUsageModelImplFromJson(Map<String, dynamic> json) =>
    _$AppUsageModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      appName: json['appName'] as String,
      packageName: json['packageName'] as String,
      appIcon: json['appIcon'] as String?,
      category: json['category'] as String,
      date: DateTime.parse(json['date'] as String),
      timeSpent: (json['timeSpent'] as num?)?.toInt() ?? 0,
      openCount: (json['openCount'] as num?)?.toInt() ?? 0,
      notificationCount: (json['notificationCount'] as num?)?.toInt() ?? 0,
      blockCount: (json['blockCount'] as num?)?.toInt() ?? 0,
      focusScore: (json['focusScore'] as num?)?.toInt() ?? 0,
      isDistraction: json['isDistraction'] as bool? ?? false,
      isProductivity: json['isProductivity'] as bool? ?? false,
      sessions: (json['sessions'] as List<dynamic>?)
              ?.map((e) => UsageSession.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AppUsageModelImplToJson(_$AppUsageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'appName': instance.appName,
      'packageName': instance.packageName,
      'appIcon': instance.appIcon,
      'category': instance.category,
      'date': instance.date.toIso8601String(),
      'timeSpent': instance.timeSpent,
      'openCount': instance.openCount,
      'notificationCount': instance.notificationCount,
      'blockCount': instance.blockCount,
      'focusScore': instance.focusScore,
      'isDistraction': instance.isDistraction,
      'isProductivity': instance.isProductivity,
      'sessions': instance.sessions,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$UsageSessionImpl _$$UsageSessionImplFromJson(Map<String, dynamic> json) =>
    _$UsageSessionImpl(
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      duration: (json['duration'] as num).toInt(),
      wasBlocked: json['wasBlocked'] as bool? ?? false,
      blockReason: json['blockReason'] as String? ?? null,
    );

Map<String, dynamic> _$$UsageSessionImplToJson(_$UsageSessionImpl instance) =>
    <String, dynamic>{
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'duration': instance.duration,
      'wasBlocked': instance.wasBlocked,
      'blockReason': instance.blockReason,
    };

_$DailyUsageStatsImpl _$$DailyUsageStatsImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyUsageStatsImpl(
      date: DateTime.parse(json['date'] as String),
      userId: json['userId'] as String,
      totalScreenTime: (json['totalScreenTime'] as num?)?.toInt() ?? 0,
      totalFocusTime: (json['totalFocusTime'] as num?)?.toInt() ?? 0,
      totalDistractedTime: (json['totalDistractedTime'] as num?)?.toInt() ?? 0,
      totalProductiveTime: (json['totalProductiveTime'] as num?)?.toInt() ?? 0,
      totalAppsUsed: (json['totalAppsUsed'] as num?)?.toInt() ?? 0,
      totalNotifications: (json['totalNotifications'] as num?)?.toInt() ?? 0,
      totalBlockedAttempts:
          (json['totalBlockedAttempts'] as num?)?.toInt() ?? 0,
      totalFocusSessions: (json['totalFocusSessions'] as num?)?.toInt() ?? 0,
      completedFocusSessions:
          (json['completedFocusSessions'] as num?)?.toInt() ?? 0,
      averageFocusScore: (json['averageFocusScore'] as num?)?.toDouble() ?? 0,
      appUsages: (json['appUsages'] as List<dynamic>?)
              ?.map((e) => AppUsageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      categoryUsage: (json['categoryUsage'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DailyUsageStatsImplToJson(
        _$DailyUsageStatsImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'userId': instance.userId,
      'totalScreenTime': instance.totalScreenTime,
      'totalFocusTime': instance.totalFocusTime,
      'totalDistractedTime': instance.totalDistractedTime,
      'totalProductiveTime': instance.totalProductiveTime,
      'totalAppsUsed': instance.totalAppsUsed,
      'totalNotifications': instance.totalNotifications,
      'totalBlockedAttempts': instance.totalBlockedAttempts,
      'totalFocusSessions': instance.totalFocusSessions,
      'completedFocusSessions': instance.completedFocusSessions,
      'averageFocusScore': instance.averageFocusScore,
      'appUsages': instance.appUsages,
      'categoryUsage': instance.categoryUsage,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
