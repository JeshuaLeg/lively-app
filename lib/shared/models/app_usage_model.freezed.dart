// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_usage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppUsageModel _$AppUsageModelFromJson(Map<String, dynamic> json) {
  return _AppUsageModel.fromJson(json);
}

/// @nodoc
mixin _$AppUsageModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get appName => throw _privateConstructorUsedError;
  String get packageName => throw _privateConstructorUsedError;
  String? get appIcon => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get timeSpent => throw _privateConstructorUsedError; // in minutes
  int get openCount => throw _privateConstructorUsedError;
  int get notificationCount => throw _privateConstructorUsedError;
  int get blockCount => throw _privateConstructorUsedError;
  int get focusScore => throw _privateConstructorUsedError; // 0-100
  bool get isDistraction => throw _privateConstructorUsedError;
  bool get isProductivity => throw _privateConstructorUsedError;
  List<UsageSession> get sessions => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this AppUsageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUsageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUsageModelCopyWith<AppUsageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUsageModelCopyWith<$Res> {
  factory $AppUsageModelCopyWith(
          AppUsageModel value, $Res Function(AppUsageModel) then) =
      _$AppUsageModelCopyWithImpl<$Res, AppUsageModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String appName,
      String packageName,
      String? appIcon,
      String category,
      DateTime date,
      int timeSpent,
      int openCount,
      int notificationCount,
      int blockCount,
      int focusScore,
      bool isDistraction,
      bool isProductivity,
      List<UsageSession> sessions,
      Map<String, dynamic> metadata,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$AppUsageModelCopyWithImpl<$Res, $Val extends AppUsageModel>
    implements $AppUsageModelCopyWith<$Res> {
  _$AppUsageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUsageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? appName = null,
    Object? packageName = null,
    Object? appIcon = freezed,
    Object? category = null,
    Object? date = null,
    Object? timeSpent = null,
    Object? openCount = null,
    Object? notificationCount = null,
    Object? blockCount = null,
    Object? focusScore = null,
    Object? isDistraction = null,
    Object? isProductivity = null,
    Object? sessions = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      appIcon: freezed == appIcon
          ? _value.appIcon
          : appIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as int,
      openCount: null == openCount
          ? _value.openCount
          : openCount // ignore: cast_nullable_to_non_nullable
              as int,
      notificationCount: null == notificationCount
          ? _value.notificationCount
          : notificationCount // ignore: cast_nullable_to_non_nullable
              as int,
      blockCount: null == blockCount
          ? _value.blockCount
          : blockCount // ignore: cast_nullable_to_non_nullable
              as int,
      focusScore: null == focusScore
          ? _value.focusScore
          : focusScore // ignore: cast_nullable_to_non_nullable
              as int,
      isDistraction: null == isDistraction
          ? _value.isDistraction
          : isDistraction // ignore: cast_nullable_to_non_nullable
              as bool,
      isProductivity: null == isProductivity
          ? _value.isProductivity
          : isProductivity // ignore: cast_nullable_to_non_nullable
              as bool,
      sessions: null == sessions
          ? _value.sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<UsageSession>,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUsageModelImplCopyWith<$Res>
    implements $AppUsageModelCopyWith<$Res> {
  factory _$$AppUsageModelImplCopyWith(
          _$AppUsageModelImpl value, $Res Function(_$AppUsageModelImpl) then) =
      __$$AppUsageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String appName,
      String packageName,
      String? appIcon,
      String category,
      DateTime date,
      int timeSpent,
      int openCount,
      int notificationCount,
      int blockCount,
      int focusScore,
      bool isDistraction,
      bool isProductivity,
      List<UsageSession> sessions,
      Map<String, dynamic> metadata,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$AppUsageModelImplCopyWithImpl<$Res>
    extends _$AppUsageModelCopyWithImpl<$Res, _$AppUsageModelImpl>
    implements _$$AppUsageModelImplCopyWith<$Res> {
  __$$AppUsageModelImplCopyWithImpl(
      _$AppUsageModelImpl _value, $Res Function(_$AppUsageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppUsageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? appName = null,
    Object? packageName = null,
    Object? appIcon = freezed,
    Object? category = null,
    Object? date = null,
    Object? timeSpent = null,
    Object? openCount = null,
    Object? notificationCount = null,
    Object? blockCount = null,
    Object? focusScore = null,
    Object? isDistraction = null,
    Object? isProductivity = null,
    Object? sessions = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$AppUsageModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      appIcon: freezed == appIcon
          ? _value.appIcon
          : appIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as int,
      openCount: null == openCount
          ? _value.openCount
          : openCount // ignore: cast_nullable_to_non_nullable
              as int,
      notificationCount: null == notificationCount
          ? _value.notificationCount
          : notificationCount // ignore: cast_nullable_to_non_nullable
              as int,
      blockCount: null == blockCount
          ? _value.blockCount
          : blockCount // ignore: cast_nullable_to_non_nullable
              as int,
      focusScore: null == focusScore
          ? _value.focusScore
          : focusScore // ignore: cast_nullable_to_non_nullable
              as int,
      isDistraction: null == isDistraction
          ? _value.isDistraction
          : isDistraction // ignore: cast_nullable_to_non_nullable
              as bool,
      isProductivity: null == isProductivity
          ? _value.isProductivity
          : isProductivity // ignore: cast_nullable_to_non_nullable
              as bool,
      sessions: null == sessions
          ? _value._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<UsageSession>,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUsageModelImpl extends _AppUsageModel {
  const _$AppUsageModelImpl(
      {required this.id,
      required this.userId,
      required this.appName,
      required this.packageName,
      this.appIcon,
      required this.category,
      required this.date,
      this.timeSpent = 0,
      this.openCount = 0,
      this.notificationCount = 0,
      this.blockCount = 0,
      this.focusScore = 0,
      this.isDistraction = false,
      this.isProductivity = false,
      final List<UsageSession> sessions = const [],
      final Map<String, dynamic> metadata = const {},
      required this.createdAt,
      required this.updatedAt})
      : _sessions = sessions,
        _metadata = metadata,
        super._();

  factory _$AppUsageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUsageModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String appName;
  @override
  final String packageName;
  @override
  final String? appIcon;
  @override
  final String category;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final int timeSpent;
// in minutes
  @override
  @JsonKey()
  final int openCount;
  @override
  @JsonKey()
  final int notificationCount;
  @override
  @JsonKey()
  final int blockCount;
  @override
  @JsonKey()
  final int focusScore;
// 0-100
  @override
  @JsonKey()
  final bool isDistraction;
  @override
  @JsonKey()
  final bool isProductivity;
  final List<UsageSession> _sessions;
  @override
  @JsonKey()
  List<UsageSession> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'AppUsageModel(id: $id, userId: $userId, appName: $appName, packageName: $packageName, appIcon: $appIcon, category: $category, date: $date, timeSpent: $timeSpent, openCount: $openCount, notificationCount: $notificationCount, blockCount: $blockCount, focusScore: $focusScore, isDistraction: $isDistraction, isProductivity: $isProductivity, sessions: $sessions, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUsageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.appIcon, appIcon) || other.appIcon == appIcon) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timeSpent, timeSpent) ||
                other.timeSpent == timeSpent) &&
            (identical(other.openCount, openCount) ||
                other.openCount == openCount) &&
            (identical(other.notificationCount, notificationCount) ||
                other.notificationCount == notificationCount) &&
            (identical(other.blockCount, blockCount) ||
                other.blockCount == blockCount) &&
            (identical(other.focusScore, focusScore) ||
                other.focusScore == focusScore) &&
            (identical(other.isDistraction, isDistraction) ||
                other.isDistraction == isDistraction) &&
            (identical(other.isProductivity, isProductivity) ||
                other.isProductivity == isProductivity) &&
            const DeepCollectionEquality().equals(other._sessions, _sessions) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      appName,
      packageName,
      appIcon,
      category,
      date,
      timeSpent,
      openCount,
      notificationCount,
      blockCount,
      focusScore,
      isDistraction,
      isProductivity,
      const DeepCollectionEquality().hash(_sessions),
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      updatedAt);

  /// Create a copy of AppUsageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUsageModelImplCopyWith<_$AppUsageModelImpl> get copyWith =>
      __$$AppUsageModelImplCopyWithImpl<_$AppUsageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUsageModelImplToJson(
      this,
    );
  }
}

abstract class _AppUsageModel extends AppUsageModel {
  const factory _AppUsageModel(
      {required final String id,
      required final String userId,
      required final String appName,
      required final String packageName,
      final String? appIcon,
      required final String category,
      required final DateTime date,
      final int timeSpent,
      final int openCount,
      final int notificationCount,
      final int blockCount,
      final int focusScore,
      final bool isDistraction,
      final bool isProductivity,
      final List<UsageSession> sessions,
      final Map<String, dynamic> metadata,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$AppUsageModelImpl;
  const _AppUsageModel._() : super._();

  factory _AppUsageModel.fromJson(Map<String, dynamic> json) =
      _$AppUsageModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get appName;
  @override
  String get packageName;
  @override
  String? get appIcon;
  @override
  String get category;
  @override
  DateTime get date;
  @override
  int get timeSpent; // in minutes
  @override
  int get openCount;
  @override
  int get notificationCount;
  @override
  int get blockCount;
  @override
  int get focusScore; // 0-100
  @override
  bool get isDistraction;
  @override
  bool get isProductivity;
  @override
  List<UsageSession> get sessions;
  @override
  Map<String, dynamic> get metadata;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of AppUsageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUsageModelImplCopyWith<_$AppUsageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UsageSession _$UsageSessionFromJson(Map<String, dynamic> json) {
  return _UsageSession.fromJson(json);
}

/// @nodoc
mixin _$UsageSession {
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError; // in minutes
  bool get wasBlocked => throw _privateConstructorUsedError;
  String? get blockReason => throw _privateConstructorUsedError;

  /// Serializes this UsageSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsageSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsageSessionCopyWith<UsageSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageSessionCopyWith<$Res> {
  factory $UsageSessionCopyWith(
          UsageSession value, $Res Function(UsageSession) then) =
      _$UsageSessionCopyWithImpl<$Res, UsageSession>;
  @useResult
  $Res call(
      {DateTime startTime,
      DateTime endTime,
      int duration,
      bool wasBlocked,
      String? blockReason});
}

/// @nodoc
class _$UsageSessionCopyWithImpl<$Res, $Val extends UsageSession>
    implements $UsageSessionCopyWith<$Res> {
  _$UsageSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsageSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = null,
    Object? wasBlocked = null,
    Object? blockReason = freezed,
  }) {
    return _then(_value.copyWith(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      wasBlocked: null == wasBlocked
          ? _value.wasBlocked
          : wasBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockReason: freezed == blockReason
          ? _value.blockReason
          : blockReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsageSessionImplCopyWith<$Res>
    implements $UsageSessionCopyWith<$Res> {
  factory _$$UsageSessionImplCopyWith(
          _$UsageSessionImpl value, $Res Function(_$UsageSessionImpl) then) =
      __$$UsageSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime startTime,
      DateTime endTime,
      int duration,
      bool wasBlocked,
      String? blockReason});
}

/// @nodoc
class __$$UsageSessionImplCopyWithImpl<$Res>
    extends _$UsageSessionCopyWithImpl<$Res, _$UsageSessionImpl>
    implements _$$UsageSessionImplCopyWith<$Res> {
  __$$UsageSessionImplCopyWithImpl(
      _$UsageSessionImpl _value, $Res Function(_$UsageSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsageSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = null,
    Object? wasBlocked = null,
    Object? blockReason = freezed,
  }) {
    return _then(_$UsageSessionImpl(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      wasBlocked: null == wasBlocked
          ? _value.wasBlocked
          : wasBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockReason: freezed == blockReason
          ? _value.blockReason
          : blockReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsageSessionImpl implements _UsageSession {
  const _$UsageSessionImpl(
      {required this.startTime,
      required this.endTime,
      required this.duration,
      this.wasBlocked = false,
      this.blockReason = null});

  factory _$UsageSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsageSessionImplFromJson(json);

  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final int duration;
// in minutes
  @override
  @JsonKey()
  final bool wasBlocked;
  @override
  @JsonKey()
  final String? blockReason;

  @override
  String toString() {
    return 'UsageSession(startTime: $startTime, endTime: $endTime, duration: $duration, wasBlocked: $wasBlocked, blockReason: $blockReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsageSessionImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.wasBlocked, wasBlocked) ||
                other.wasBlocked == wasBlocked) &&
            (identical(other.blockReason, blockReason) ||
                other.blockReason == blockReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, startTime, endTime, duration, wasBlocked, blockReason);

  /// Create a copy of UsageSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsageSessionImplCopyWith<_$UsageSessionImpl> get copyWith =>
      __$$UsageSessionImplCopyWithImpl<_$UsageSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsageSessionImplToJson(
      this,
    );
  }
}

abstract class _UsageSession implements UsageSession {
  const factory _UsageSession(
      {required final DateTime startTime,
      required final DateTime endTime,
      required final int duration,
      final bool wasBlocked,
      final String? blockReason}) = _$UsageSessionImpl;

  factory _UsageSession.fromJson(Map<String, dynamic> json) =
      _$UsageSessionImpl.fromJson;

  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  int get duration; // in minutes
  @override
  bool get wasBlocked;
  @override
  String? get blockReason;

  /// Create a copy of UsageSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsageSessionImplCopyWith<_$UsageSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyUsageStats _$DailyUsageStatsFromJson(Map<String, dynamic> json) {
  return _DailyUsageStats.fromJson(json);
}

/// @nodoc
mixin _$DailyUsageStats {
  DateTime get date => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get totalScreenTime => throw _privateConstructorUsedError; // in minutes
  int get totalFocusTime => throw _privateConstructorUsedError; // in minutes
  int get totalDistractedTime =>
      throw _privateConstructorUsedError; // in minutes
  int get totalProductiveTime =>
      throw _privateConstructorUsedError; // in minutes
  int get totalAppsUsed => throw _privateConstructorUsedError;
  int get totalNotifications => throw _privateConstructorUsedError;
  int get totalBlockedAttempts => throw _privateConstructorUsedError;
  int get totalFocusSessions => throw _privateConstructorUsedError;
  int get completedFocusSessions => throw _privateConstructorUsedError;
  double get averageFocusScore => throw _privateConstructorUsedError;
  List<AppUsageModel> get appUsages => throw _privateConstructorUsedError;
  Map<String, int> get categoryUsage => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DailyUsageStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyUsageStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyUsageStatsCopyWith<DailyUsageStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyUsageStatsCopyWith<$Res> {
  factory $DailyUsageStatsCopyWith(
          DailyUsageStats value, $Res Function(DailyUsageStats) then) =
      _$DailyUsageStatsCopyWithImpl<$Res, DailyUsageStats>;
  @useResult
  $Res call(
      {DateTime date,
      String userId,
      int totalScreenTime,
      int totalFocusTime,
      int totalDistractedTime,
      int totalProductiveTime,
      int totalAppsUsed,
      int totalNotifications,
      int totalBlockedAttempts,
      int totalFocusSessions,
      int completedFocusSessions,
      double averageFocusScore,
      List<AppUsageModel> appUsages,
      Map<String, int> categoryUsage,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$DailyUsageStatsCopyWithImpl<$Res, $Val extends DailyUsageStats>
    implements $DailyUsageStatsCopyWith<$Res> {
  _$DailyUsageStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyUsageStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? userId = null,
    Object? totalScreenTime = null,
    Object? totalFocusTime = null,
    Object? totalDistractedTime = null,
    Object? totalProductiveTime = null,
    Object? totalAppsUsed = null,
    Object? totalNotifications = null,
    Object? totalBlockedAttempts = null,
    Object? totalFocusSessions = null,
    Object? completedFocusSessions = null,
    Object? averageFocusScore = null,
    Object? appUsages = null,
    Object? categoryUsage = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalScreenTime: null == totalScreenTime
          ? _value.totalScreenTime
          : totalScreenTime // ignore: cast_nullable_to_non_nullable
              as int,
      totalFocusTime: null == totalFocusTime
          ? _value.totalFocusTime
          : totalFocusTime // ignore: cast_nullable_to_non_nullable
              as int,
      totalDistractedTime: null == totalDistractedTime
          ? _value.totalDistractedTime
          : totalDistractedTime // ignore: cast_nullable_to_non_nullable
              as int,
      totalProductiveTime: null == totalProductiveTime
          ? _value.totalProductiveTime
          : totalProductiveTime // ignore: cast_nullable_to_non_nullable
              as int,
      totalAppsUsed: null == totalAppsUsed
          ? _value.totalAppsUsed
          : totalAppsUsed // ignore: cast_nullable_to_non_nullable
              as int,
      totalNotifications: null == totalNotifications
          ? _value.totalNotifications
          : totalNotifications // ignore: cast_nullable_to_non_nullable
              as int,
      totalBlockedAttempts: null == totalBlockedAttempts
          ? _value.totalBlockedAttempts
          : totalBlockedAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      totalFocusSessions: null == totalFocusSessions
          ? _value.totalFocusSessions
          : totalFocusSessions // ignore: cast_nullable_to_non_nullable
              as int,
      completedFocusSessions: null == completedFocusSessions
          ? _value.completedFocusSessions
          : completedFocusSessions // ignore: cast_nullable_to_non_nullable
              as int,
      averageFocusScore: null == averageFocusScore
          ? _value.averageFocusScore
          : averageFocusScore // ignore: cast_nullable_to_non_nullable
              as double,
      appUsages: null == appUsages
          ? _value.appUsages
          : appUsages // ignore: cast_nullable_to_non_nullable
              as List<AppUsageModel>,
      categoryUsage: null == categoryUsage
          ? _value.categoryUsage
          : categoryUsage // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyUsageStatsImplCopyWith<$Res>
    implements $DailyUsageStatsCopyWith<$Res> {
  factory _$$DailyUsageStatsImplCopyWith(_$DailyUsageStatsImpl value,
          $Res Function(_$DailyUsageStatsImpl) then) =
      __$$DailyUsageStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      String userId,
      int totalScreenTime,
      int totalFocusTime,
      int totalDistractedTime,
      int totalProductiveTime,
      int totalAppsUsed,
      int totalNotifications,
      int totalBlockedAttempts,
      int totalFocusSessions,
      int completedFocusSessions,
      double averageFocusScore,
      List<AppUsageModel> appUsages,
      Map<String, int> categoryUsage,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$DailyUsageStatsImplCopyWithImpl<$Res>
    extends _$DailyUsageStatsCopyWithImpl<$Res, _$DailyUsageStatsImpl>
    implements _$$DailyUsageStatsImplCopyWith<$Res> {
  __$$DailyUsageStatsImplCopyWithImpl(
      _$DailyUsageStatsImpl _value, $Res Function(_$DailyUsageStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyUsageStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? userId = null,
    Object? totalScreenTime = null,
    Object? totalFocusTime = null,
    Object? totalDistractedTime = null,
    Object? totalProductiveTime = null,
    Object? totalAppsUsed = null,
    Object? totalNotifications = null,
    Object? totalBlockedAttempts = null,
    Object? totalFocusSessions = null,
    Object? completedFocusSessions = null,
    Object? averageFocusScore = null,
    Object? appUsages = null,
    Object? categoryUsage = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DailyUsageStatsImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalScreenTime: null == totalScreenTime
          ? _value.totalScreenTime
          : totalScreenTime // ignore: cast_nullable_to_non_nullable
              as int,
      totalFocusTime: null == totalFocusTime
          ? _value.totalFocusTime
          : totalFocusTime // ignore: cast_nullable_to_non_nullable
              as int,
      totalDistractedTime: null == totalDistractedTime
          ? _value.totalDistractedTime
          : totalDistractedTime // ignore: cast_nullable_to_non_nullable
              as int,
      totalProductiveTime: null == totalProductiveTime
          ? _value.totalProductiveTime
          : totalProductiveTime // ignore: cast_nullable_to_non_nullable
              as int,
      totalAppsUsed: null == totalAppsUsed
          ? _value.totalAppsUsed
          : totalAppsUsed // ignore: cast_nullable_to_non_nullable
              as int,
      totalNotifications: null == totalNotifications
          ? _value.totalNotifications
          : totalNotifications // ignore: cast_nullable_to_non_nullable
              as int,
      totalBlockedAttempts: null == totalBlockedAttempts
          ? _value.totalBlockedAttempts
          : totalBlockedAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      totalFocusSessions: null == totalFocusSessions
          ? _value.totalFocusSessions
          : totalFocusSessions // ignore: cast_nullable_to_non_nullable
              as int,
      completedFocusSessions: null == completedFocusSessions
          ? _value.completedFocusSessions
          : completedFocusSessions // ignore: cast_nullable_to_non_nullable
              as int,
      averageFocusScore: null == averageFocusScore
          ? _value.averageFocusScore
          : averageFocusScore // ignore: cast_nullable_to_non_nullable
              as double,
      appUsages: null == appUsages
          ? _value._appUsages
          : appUsages // ignore: cast_nullable_to_non_nullable
              as List<AppUsageModel>,
      categoryUsage: null == categoryUsage
          ? _value._categoryUsage
          : categoryUsage // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyUsageStatsImpl extends _DailyUsageStats {
  const _$DailyUsageStatsImpl(
      {required this.date,
      required this.userId,
      this.totalScreenTime = 0,
      this.totalFocusTime = 0,
      this.totalDistractedTime = 0,
      this.totalProductiveTime = 0,
      this.totalAppsUsed = 0,
      this.totalNotifications = 0,
      this.totalBlockedAttempts = 0,
      this.totalFocusSessions = 0,
      this.completedFocusSessions = 0,
      this.averageFocusScore = 0,
      final List<AppUsageModel> appUsages = const [],
      final Map<String, int> categoryUsage = const {},
      required this.createdAt,
      required this.updatedAt})
      : _appUsages = appUsages,
        _categoryUsage = categoryUsage,
        super._();

  factory _$DailyUsageStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyUsageStatsImplFromJson(json);

  @override
  final DateTime date;
  @override
  final String userId;
  @override
  @JsonKey()
  final int totalScreenTime;
// in minutes
  @override
  @JsonKey()
  final int totalFocusTime;
// in minutes
  @override
  @JsonKey()
  final int totalDistractedTime;
// in minutes
  @override
  @JsonKey()
  final int totalProductiveTime;
// in minutes
  @override
  @JsonKey()
  final int totalAppsUsed;
  @override
  @JsonKey()
  final int totalNotifications;
  @override
  @JsonKey()
  final int totalBlockedAttempts;
  @override
  @JsonKey()
  final int totalFocusSessions;
  @override
  @JsonKey()
  final int completedFocusSessions;
  @override
  @JsonKey()
  final double averageFocusScore;
  final List<AppUsageModel> _appUsages;
  @override
  @JsonKey()
  List<AppUsageModel> get appUsages {
    if (_appUsages is EqualUnmodifiableListView) return _appUsages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appUsages);
  }

  final Map<String, int> _categoryUsage;
  @override
  @JsonKey()
  Map<String, int> get categoryUsage {
    if (_categoryUsage is EqualUnmodifiableMapView) return _categoryUsage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryUsage);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'DailyUsageStats(date: $date, userId: $userId, totalScreenTime: $totalScreenTime, totalFocusTime: $totalFocusTime, totalDistractedTime: $totalDistractedTime, totalProductiveTime: $totalProductiveTime, totalAppsUsed: $totalAppsUsed, totalNotifications: $totalNotifications, totalBlockedAttempts: $totalBlockedAttempts, totalFocusSessions: $totalFocusSessions, completedFocusSessions: $completedFocusSessions, averageFocusScore: $averageFocusScore, appUsages: $appUsages, categoryUsage: $categoryUsage, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyUsageStatsImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.totalScreenTime, totalScreenTime) ||
                other.totalScreenTime == totalScreenTime) &&
            (identical(other.totalFocusTime, totalFocusTime) ||
                other.totalFocusTime == totalFocusTime) &&
            (identical(other.totalDistractedTime, totalDistractedTime) ||
                other.totalDistractedTime == totalDistractedTime) &&
            (identical(other.totalProductiveTime, totalProductiveTime) ||
                other.totalProductiveTime == totalProductiveTime) &&
            (identical(other.totalAppsUsed, totalAppsUsed) ||
                other.totalAppsUsed == totalAppsUsed) &&
            (identical(other.totalNotifications, totalNotifications) ||
                other.totalNotifications == totalNotifications) &&
            (identical(other.totalBlockedAttempts, totalBlockedAttempts) ||
                other.totalBlockedAttempts == totalBlockedAttempts) &&
            (identical(other.totalFocusSessions, totalFocusSessions) ||
                other.totalFocusSessions == totalFocusSessions) &&
            (identical(other.completedFocusSessions, completedFocusSessions) ||
                other.completedFocusSessions == completedFocusSessions) &&
            (identical(other.averageFocusScore, averageFocusScore) ||
                other.averageFocusScore == averageFocusScore) &&
            const DeepCollectionEquality()
                .equals(other._appUsages, _appUsages) &&
            const DeepCollectionEquality()
                .equals(other._categoryUsage, _categoryUsage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      userId,
      totalScreenTime,
      totalFocusTime,
      totalDistractedTime,
      totalProductiveTime,
      totalAppsUsed,
      totalNotifications,
      totalBlockedAttempts,
      totalFocusSessions,
      completedFocusSessions,
      averageFocusScore,
      const DeepCollectionEquality().hash(_appUsages),
      const DeepCollectionEquality().hash(_categoryUsage),
      createdAt,
      updatedAt);

  /// Create a copy of DailyUsageStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyUsageStatsImplCopyWith<_$DailyUsageStatsImpl> get copyWith =>
      __$$DailyUsageStatsImplCopyWithImpl<_$DailyUsageStatsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyUsageStatsImplToJson(
      this,
    );
  }
}

abstract class _DailyUsageStats extends DailyUsageStats {
  const factory _DailyUsageStats(
      {required final DateTime date,
      required final String userId,
      final int totalScreenTime,
      final int totalFocusTime,
      final int totalDistractedTime,
      final int totalProductiveTime,
      final int totalAppsUsed,
      final int totalNotifications,
      final int totalBlockedAttempts,
      final int totalFocusSessions,
      final int completedFocusSessions,
      final double averageFocusScore,
      final List<AppUsageModel> appUsages,
      final Map<String, int> categoryUsage,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$DailyUsageStatsImpl;
  const _DailyUsageStats._() : super._();

  factory _DailyUsageStats.fromJson(Map<String, dynamic> json) =
      _$DailyUsageStatsImpl.fromJson;

  @override
  DateTime get date;
  @override
  String get userId;
  @override
  int get totalScreenTime; // in minutes
  @override
  int get totalFocusTime; // in minutes
  @override
  int get totalDistractedTime; // in minutes
  @override
  int get totalProductiveTime; // in minutes
  @override
  int get totalAppsUsed;
  @override
  int get totalNotifications;
  @override
  int get totalBlockedAttempts;
  @override
  int get totalFocusSessions;
  @override
  int get completedFocusSessions;
  @override
  double get averageFocusScore;
  @override
  List<AppUsageModel> get appUsages;
  @override
  Map<String, int> get categoryUsage;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of DailyUsageStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyUsageStatsImplCopyWith<_$DailyUsageStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
