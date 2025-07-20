// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'focus_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FocusSessionModel _$FocusSessionModelFromJson(Map<String, dynamic> json) {
  return _FocusSessionModel.fromJson(json);
}

/// @nodoc
mixin _$FocusSessionModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  SessionType get type => throw _privateConstructorUsedError;
  SessionStatus get status => throw _privateConstructorUsedError;
  DifficultyLevel get difficulty => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError; // in minutes
  int get focusedTime => throw _privateConstructorUsedError; // in minutes
  int get breakTime => throw _privateConstructorUsedError; // in minutes
  List<String> get blockedApps => throw _privateConstructorUsedError;
  List<String> get allowedApps => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  bool get isRecurring => throw _privateConstructorUsedError;
  Map<String, dynamic>? get recurringSettings =>
      throw _privateConstructorUsedError;
  DateTime? get scheduledStartTime => throw _privateConstructorUsedError;
  DateTime? get scheduledEndTime => throw _privateConstructorUsedError;
  DateTime? get actualStartTime => throw _privateConstructorUsedError;
  DateTime? get actualEndTime => throw _privateConstructorUsedError;
  DateTime? get pausedAt => throw _privateConstructorUsedError;
  int get pauseCount => throw _privateConstructorUsedError;
  int get totalPauseTime => throw _privateConstructorUsedError; // in minutes
  List<String> get distractionAttempts => throw _privateConstructorUsedError;
  int get focusScore => throw _privateConstructorUsedError; // 0-100
  String? get completionNote => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FocusSessionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FocusSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FocusSessionModelCopyWith<FocusSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FocusSessionModelCopyWith<$Res> {
  factory $FocusSessionModelCopyWith(
          FocusSessionModel value, $Res Function(FocusSessionModel) then) =
      _$FocusSessionModelCopyWithImpl<$Res, FocusSessionModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String? description,
      SessionType type,
      SessionStatus status,
      DifficultyLevel difficulty,
      int duration,
      int focusedTime,
      int breakTime,
      List<String> blockedApps,
      List<String> allowedApps,
      List<String> categories,
      bool isRecurring,
      Map<String, dynamic>? recurringSettings,
      DateTime? scheduledStartTime,
      DateTime? scheduledEndTime,
      DateTime? actualStartTime,
      DateTime? actualEndTime,
      DateTime? pausedAt,
      int pauseCount,
      int totalPauseTime,
      List<String> distractionAttempts,
      int focusScore,
      String? completionNote,
      Map<String, dynamic> metadata,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$FocusSessionModelCopyWithImpl<$Res, $Val extends FocusSessionModel>
    implements $FocusSessionModelCopyWith<$Res> {
  _$FocusSessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FocusSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = freezed,
    Object? type = null,
    Object? status = null,
    Object? difficulty = null,
    Object? duration = null,
    Object? focusedTime = null,
    Object? breakTime = null,
    Object? blockedApps = null,
    Object? allowedApps = null,
    Object? categories = null,
    Object? isRecurring = null,
    Object? recurringSettings = freezed,
    Object? scheduledStartTime = freezed,
    Object? scheduledEndTime = freezed,
    Object? actualStartTime = freezed,
    Object? actualEndTime = freezed,
    Object? pausedAt = freezed,
    Object? pauseCount = null,
    Object? totalPauseTime = null,
    Object? distractionAttempts = null,
    Object? focusScore = null,
    Object? completionNote = freezed,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SessionType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as DifficultyLevel,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      focusedTime: null == focusedTime
          ? _value.focusedTime
          : focusedTime // ignore: cast_nullable_to_non_nullable
              as int,
      breakTime: null == breakTime
          ? _value.breakTime
          : breakTime // ignore: cast_nullable_to_non_nullable
              as int,
      blockedApps: null == blockedApps
          ? _value.blockedApps
          : blockedApps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allowedApps: null == allowedApps
          ? _value.allowedApps
          : allowedApps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      recurringSettings: freezed == recurringSettings
          ? _value.recurringSettings
          : recurringSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      scheduledStartTime: freezed == scheduledStartTime
          ? _value.scheduledStartTime
          : scheduledStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scheduledEndTime: freezed == scheduledEndTime
          ? _value.scheduledEndTime
          : scheduledEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualStartTime: freezed == actualStartTime
          ? _value.actualStartTime
          : actualStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualEndTime: freezed == actualEndTime
          ? _value.actualEndTime
          : actualEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pausedAt: freezed == pausedAt
          ? _value.pausedAt
          : pausedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pauseCount: null == pauseCount
          ? _value.pauseCount
          : pauseCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPauseTime: null == totalPauseTime
          ? _value.totalPauseTime
          : totalPauseTime // ignore: cast_nullable_to_non_nullable
              as int,
      distractionAttempts: null == distractionAttempts
          ? _value.distractionAttempts
          : distractionAttempts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      focusScore: null == focusScore
          ? _value.focusScore
          : focusScore // ignore: cast_nullable_to_non_nullable
              as int,
      completionNote: freezed == completionNote
          ? _value.completionNote
          : completionNote // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$FocusSessionModelImplCopyWith<$Res>
    implements $FocusSessionModelCopyWith<$Res> {
  factory _$$FocusSessionModelImplCopyWith(_$FocusSessionModelImpl value,
          $Res Function(_$FocusSessionModelImpl) then) =
      __$$FocusSessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String? description,
      SessionType type,
      SessionStatus status,
      DifficultyLevel difficulty,
      int duration,
      int focusedTime,
      int breakTime,
      List<String> blockedApps,
      List<String> allowedApps,
      List<String> categories,
      bool isRecurring,
      Map<String, dynamic>? recurringSettings,
      DateTime? scheduledStartTime,
      DateTime? scheduledEndTime,
      DateTime? actualStartTime,
      DateTime? actualEndTime,
      DateTime? pausedAt,
      int pauseCount,
      int totalPauseTime,
      List<String> distractionAttempts,
      int focusScore,
      String? completionNote,
      Map<String, dynamic> metadata,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$FocusSessionModelImplCopyWithImpl<$Res>
    extends _$FocusSessionModelCopyWithImpl<$Res, _$FocusSessionModelImpl>
    implements _$$FocusSessionModelImplCopyWith<$Res> {
  __$$FocusSessionModelImplCopyWithImpl(_$FocusSessionModelImpl _value,
      $Res Function(_$FocusSessionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FocusSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = freezed,
    Object? type = null,
    Object? status = null,
    Object? difficulty = null,
    Object? duration = null,
    Object? focusedTime = null,
    Object? breakTime = null,
    Object? blockedApps = null,
    Object? allowedApps = null,
    Object? categories = null,
    Object? isRecurring = null,
    Object? recurringSettings = freezed,
    Object? scheduledStartTime = freezed,
    Object? scheduledEndTime = freezed,
    Object? actualStartTime = freezed,
    Object? actualEndTime = freezed,
    Object? pausedAt = freezed,
    Object? pauseCount = null,
    Object? totalPauseTime = null,
    Object? distractionAttempts = null,
    Object? focusScore = null,
    Object? completionNote = freezed,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$FocusSessionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SessionType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as DifficultyLevel,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      focusedTime: null == focusedTime
          ? _value.focusedTime
          : focusedTime // ignore: cast_nullable_to_non_nullable
              as int,
      breakTime: null == breakTime
          ? _value.breakTime
          : breakTime // ignore: cast_nullable_to_non_nullable
              as int,
      blockedApps: null == blockedApps
          ? _value._blockedApps
          : blockedApps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allowedApps: null == allowedApps
          ? _value._allowedApps
          : allowedApps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      recurringSettings: freezed == recurringSettings
          ? _value._recurringSettings
          : recurringSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      scheduledStartTime: freezed == scheduledStartTime
          ? _value.scheduledStartTime
          : scheduledStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scheduledEndTime: freezed == scheduledEndTime
          ? _value.scheduledEndTime
          : scheduledEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualStartTime: freezed == actualStartTime
          ? _value.actualStartTime
          : actualStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualEndTime: freezed == actualEndTime
          ? _value.actualEndTime
          : actualEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pausedAt: freezed == pausedAt
          ? _value.pausedAt
          : pausedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pauseCount: null == pauseCount
          ? _value.pauseCount
          : pauseCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPauseTime: null == totalPauseTime
          ? _value.totalPauseTime
          : totalPauseTime // ignore: cast_nullable_to_non_nullable
              as int,
      distractionAttempts: null == distractionAttempts
          ? _value._distractionAttempts
          : distractionAttempts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      focusScore: null == focusScore
          ? _value.focusScore
          : focusScore // ignore: cast_nullable_to_non_nullable
              as int,
      completionNote: freezed == completionNote
          ? _value.completionNote
          : completionNote // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$FocusSessionModelImpl extends _FocusSessionModel {
  const _$FocusSessionModelImpl(
      {required this.id,
      required this.userId,
      required this.title,
      this.description,
      required this.type,
      required this.status,
      required this.difficulty,
      required this.duration,
      this.focusedTime = 0,
      this.breakTime = 0,
      final List<String> blockedApps = const [],
      final List<String> allowedApps = const [],
      final List<String> categories = const [],
      this.isRecurring = false,
      final Map<String, dynamic>? recurringSettings = null,
      this.scheduledStartTime = null,
      this.scheduledEndTime = null,
      this.actualStartTime = null,
      this.actualEndTime = null,
      this.pausedAt = null,
      this.pauseCount = 0,
      this.totalPauseTime = 0,
      final List<String> distractionAttempts = const [],
      this.focusScore = 0,
      this.completionNote = null,
      final Map<String, dynamic> metadata = const {},
      required this.createdAt,
      required this.updatedAt})
      : _blockedApps = blockedApps,
        _allowedApps = allowedApps,
        _categories = categories,
        _recurringSettings = recurringSettings,
        _distractionAttempts = distractionAttempts,
        _metadata = metadata,
        super._();

  factory _$FocusSessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FocusSessionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String title;
  @override
  final String? description;
  @override
  final SessionType type;
  @override
  final SessionStatus status;
  @override
  final DifficultyLevel difficulty;
  @override
  final int duration;
// in minutes
  @override
  @JsonKey()
  final int focusedTime;
// in minutes
  @override
  @JsonKey()
  final int breakTime;
// in minutes
  final List<String> _blockedApps;
// in minutes
  @override
  @JsonKey()
  List<String> get blockedApps {
    if (_blockedApps is EqualUnmodifiableListView) return _blockedApps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blockedApps);
  }

  final List<String> _allowedApps;
  @override
  @JsonKey()
  List<String> get allowedApps {
    if (_allowedApps is EqualUnmodifiableListView) return _allowedApps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedApps);
  }

  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final bool isRecurring;
  final Map<String, dynamic>? _recurringSettings;
  @override
  @JsonKey()
  Map<String, dynamic>? get recurringSettings {
    final value = _recurringSettings;
    if (value == null) return null;
    if (_recurringSettings is EqualUnmodifiableMapView)
      return _recurringSettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final DateTime? scheduledStartTime;
  @override
  @JsonKey()
  final DateTime? scheduledEndTime;
  @override
  @JsonKey()
  final DateTime? actualStartTime;
  @override
  @JsonKey()
  final DateTime? actualEndTime;
  @override
  @JsonKey()
  final DateTime? pausedAt;
  @override
  @JsonKey()
  final int pauseCount;
  @override
  @JsonKey()
  final int totalPauseTime;
// in minutes
  final List<String> _distractionAttempts;
// in minutes
  @override
  @JsonKey()
  List<String> get distractionAttempts {
    if (_distractionAttempts is EqualUnmodifiableListView)
      return _distractionAttempts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_distractionAttempts);
  }

  @override
  @JsonKey()
  final int focusScore;
// 0-100
  @override
  @JsonKey()
  final String? completionNote;
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
    return 'FocusSessionModel(id: $id, userId: $userId, title: $title, description: $description, type: $type, status: $status, difficulty: $difficulty, duration: $duration, focusedTime: $focusedTime, breakTime: $breakTime, blockedApps: $blockedApps, allowedApps: $allowedApps, categories: $categories, isRecurring: $isRecurring, recurringSettings: $recurringSettings, scheduledStartTime: $scheduledStartTime, scheduledEndTime: $scheduledEndTime, actualStartTime: $actualStartTime, actualEndTime: $actualEndTime, pausedAt: $pausedAt, pauseCount: $pauseCount, totalPauseTime: $totalPauseTime, distractionAttempts: $distractionAttempts, focusScore: $focusScore, completionNote: $completionNote, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FocusSessionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.focusedTime, focusedTime) ||
                other.focusedTime == focusedTime) &&
            (identical(other.breakTime, breakTime) ||
                other.breakTime == breakTime) &&
            const DeepCollectionEquality()
                .equals(other._blockedApps, _blockedApps) &&
            const DeepCollectionEquality()
                .equals(other._allowedApps, _allowedApps) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            const DeepCollectionEquality()
                .equals(other._recurringSettings, _recurringSettings) &&
            (identical(other.scheduledStartTime, scheduledStartTime) ||
                other.scheduledStartTime == scheduledStartTime) &&
            (identical(other.scheduledEndTime, scheduledEndTime) ||
                other.scheduledEndTime == scheduledEndTime) &&
            (identical(other.actualStartTime, actualStartTime) ||
                other.actualStartTime == actualStartTime) &&
            (identical(other.actualEndTime, actualEndTime) ||
                other.actualEndTime == actualEndTime) &&
            (identical(other.pausedAt, pausedAt) ||
                other.pausedAt == pausedAt) &&
            (identical(other.pauseCount, pauseCount) ||
                other.pauseCount == pauseCount) &&
            (identical(other.totalPauseTime, totalPauseTime) ||
                other.totalPauseTime == totalPauseTime) &&
            const DeepCollectionEquality()
                .equals(other._distractionAttempts, _distractionAttempts) &&
            (identical(other.focusScore, focusScore) ||
                other.focusScore == focusScore) &&
            (identical(other.completionNote, completionNote) ||
                other.completionNote == completionNote) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        title,
        description,
        type,
        status,
        difficulty,
        duration,
        focusedTime,
        breakTime,
        const DeepCollectionEquality().hash(_blockedApps),
        const DeepCollectionEquality().hash(_allowedApps),
        const DeepCollectionEquality().hash(_categories),
        isRecurring,
        const DeepCollectionEquality().hash(_recurringSettings),
        scheduledStartTime,
        scheduledEndTime,
        actualStartTime,
        actualEndTime,
        pausedAt,
        pauseCount,
        totalPauseTime,
        const DeepCollectionEquality().hash(_distractionAttempts),
        focusScore,
        completionNote,
        const DeepCollectionEquality().hash(_metadata),
        createdAt,
        updatedAt
      ]);

  /// Create a copy of FocusSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FocusSessionModelImplCopyWith<_$FocusSessionModelImpl> get copyWith =>
      __$$FocusSessionModelImplCopyWithImpl<_$FocusSessionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FocusSessionModelImplToJson(
      this,
    );
  }
}

abstract class _FocusSessionModel extends FocusSessionModel {
  const factory _FocusSessionModel(
      {required final String id,
      required final String userId,
      required final String title,
      final String? description,
      required final SessionType type,
      required final SessionStatus status,
      required final DifficultyLevel difficulty,
      required final int duration,
      final int focusedTime,
      final int breakTime,
      final List<String> blockedApps,
      final List<String> allowedApps,
      final List<String> categories,
      final bool isRecurring,
      final Map<String, dynamic>? recurringSettings,
      final DateTime? scheduledStartTime,
      final DateTime? scheduledEndTime,
      final DateTime? actualStartTime,
      final DateTime? actualEndTime,
      final DateTime? pausedAt,
      final int pauseCount,
      final int totalPauseTime,
      final List<String> distractionAttempts,
      final int focusScore,
      final String? completionNote,
      final Map<String, dynamic> metadata,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$FocusSessionModelImpl;
  const _FocusSessionModel._() : super._();

  factory _FocusSessionModel.fromJson(Map<String, dynamic> json) =
      _$FocusSessionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get title;
  @override
  String? get description;
  @override
  SessionType get type;
  @override
  SessionStatus get status;
  @override
  DifficultyLevel get difficulty;
  @override
  int get duration; // in minutes
  @override
  int get focusedTime; // in minutes
  @override
  int get breakTime; // in minutes
  @override
  List<String> get blockedApps;
  @override
  List<String> get allowedApps;
  @override
  List<String> get categories;
  @override
  bool get isRecurring;
  @override
  Map<String, dynamic>? get recurringSettings;
  @override
  DateTime? get scheduledStartTime;
  @override
  DateTime? get scheduledEndTime;
  @override
  DateTime? get actualStartTime;
  @override
  DateTime? get actualEndTime;
  @override
  DateTime? get pausedAt;
  @override
  int get pauseCount;
  @override
  int get totalPauseTime; // in minutes
  @override
  List<String> get distractionAttempts;
  @override
  int get focusScore; // 0-100
  @override
  String? get completionNote;
  @override
  Map<String, dynamic> get metadata;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of FocusSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FocusSessionModelImplCopyWith<_$FocusSessionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
