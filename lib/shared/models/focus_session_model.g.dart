// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FocusSessionModelImpl _$$FocusSessionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FocusSessionModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      type: $enumDecode(_$SessionTypeEnumMap, json['type']),
      status: $enumDecode(_$SessionStatusEnumMap, json['status']),
      difficulty: $enumDecode(_$DifficultyLevelEnumMap, json['difficulty']),
      duration: (json['duration'] as num).toInt(),
      focusedTime: (json['focusedTime'] as num?)?.toInt() ?? 0,
      breakTime: (json['breakTime'] as num?)?.toInt() ?? 0,
      blockedApps: (json['blockedApps'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      allowedApps: (json['allowedApps'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isRecurring: json['isRecurring'] as bool? ?? false,
      recurringSettings:
          json['recurringSettings'] as Map<String, dynamic>? ?? null,
      scheduledStartTime: json['scheduledStartTime'] == null
          ? null
          : DateTime.parse(json['scheduledStartTime'] as String),
      scheduledEndTime: json['scheduledEndTime'] == null
          ? null
          : DateTime.parse(json['scheduledEndTime'] as String),
      actualStartTime: json['actualStartTime'] == null
          ? null
          : DateTime.parse(json['actualStartTime'] as String),
      actualEndTime: json['actualEndTime'] == null
          ? null
          : DateTime.parse(json['actualEndTime'] as String),
      pausedAt: json['pausedAt'] == null
          ? null
          : DateTime.parse(json['pausedAt'] as String),
      pauseCount: (json['pauseCount'] as num?)?.toInt() ?? 0,
      totalPauseTime: (json['totalPauseTime'] as num?)?.toInt() ?? 0,
      distractionAttempts: (json['distractionAttempts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      focusScore: (json['focusScore'] as num?)?.toInt() ?? 0,
      completionNote: json['completionNote'] as String? ?? null,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$FocusSessionModelImplToJson(
        _$FocusSessionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'type': _$SessionTypeEnumMap[instance.type]!,
      'status': _$SessionStatusEnumMap[instance.status]!,
      'difficulty': _$DifficultyLevelEnumMap[instance.difficulty]!,
      'duration': instance.duration,
      'focusedTime': instance.focusedTime,
      'breakTime': instance.breakTime,
      'blockedApps': instance.blockedApps,
      'allowedApps': instance.allowedApps,
      'categories': instance.categories,
      'isRecurring': instance.isRecurring,
      'recurringSettings': instance.recurringSettings,
      'scheduledStartTime': instance.scheduledStartTime?.toIso8601String(),
      'scheduledEndTime': instance.scheduledEndTime?.toIso8601String(),
      'actualStartTime': instance.actualStartTime?.toIso8601String(),
      'actualEndTime': instance.actualEndTime?.toIso8601String(),
      'pausedAt': instance.pausedAt?.toIso8601String(),
      'pauseCount': instance.pauseCount,
      'totalPauseTime': instance.totalPauseTime,
      'distractionAttempts': instance.distractionAttempts,
      'focusScore': instance.focusScore,
      'completionNote': instance.completionNote,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$SessionTypeEnumMap = {
  SessionType.timer: 'timer',
  SessionType.scheduled: 'scheduled',
  SessionType.deepFocus: 'deepFocus',
};

const _$SessionStatusEnumMap = {
  SessionStatus.pending: 'pending',
  SessionStatus.active: 'active',
  SessionStatus.paused: 'paused',
  SessionStatus.completed: 'completed',
  SessionStatus.cancelled: 'cancelled',
};

const _$DifficultyLevelEnumMap = {
  DifficultyLevel.normal: 'normal',
  DifficultyLevel.timeout: 'timeout',
  DifficultyLevel.deepFocus: 'deepFocus',
};
