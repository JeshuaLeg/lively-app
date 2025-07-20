// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  bool get isEmailVerified => throw _privateConstructorUsedError;
  bool get isOnboardingCompleted => throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;
  int get totalFocusTime => throw _privateConstructorUsedError; // in minutes
  int get totalSessions => throw _privateConstructorUsedError;
  int get currentStreak => throw _privateConstructorUsedError;
  int get longestStreak => throw _privateConstructorUsedError;
  int get dailyGoal => throw _privateConstructorUsedError; // in minutes
  int get weeklyGoal => throw _privateConstructorUsedError; // in minutes
  List<String> get blockedApps => throw _privateConstructorUsedError;
  List<String> get allowedApps => throw _privateConstructorUsedError;
  List<String> get friends => throw _privateConstructorUsedError;
  List<String> get achievements => throw _privateConstructorUsedError;
  String get themeMode => throw _privateConstructorUsedError;
  bool get notificationsEnabled => throw _privateConstructorUsedError;
  bool get soundEnabled => throw _privateConstructorUsedError;
  bool get vibrationEnabled => throw _privateConstructorUsedError;
  String get defaultDifficulty => throw _privateConstructorUsedError;
  int get defaultSessionDuration =>
      throw _privateConstructorUsedError; // in minutes
  int get shortBreakDuration =>
      throw _privateConstructorUsedError; // in minutes
  int get longBreakDuration => throw _privateConstructorUsedError; // in minutes
  DateTime? get lastActiveDate => throw _privateConstructorUsedError;
  DateTime? get premiumExpiryDate => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      String email,
      String? displayName,
      String? photoUrl,
      String? phoneNumber,
      bool isEmailVerified,
      bool isOnboardingCompleted,
      bool isPremium,
      int totalFocusTime,
      int totalSessions,
      int currentStreak,
      int longestStreak,
      int dailyGoal,
      int weeklyGoal,
      List<String> blockedApps,
      List<String> allowedApps,
      List<String> friends,
      List<String> achievements,
      String themeMode,
      bool notificationsEnabled,
      bool soundEnabled,
      bool vibrationEnabled,
      String defaultDifficulty,
      int defaultSessionDuration,
      int shortBreakDuration,
      int longBreakDuration,
      DateTime? lastActiveDate,
      DateTime? premiumExpiryDate,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
    Object? phoneNumber = freezed,
    Object? isEmailVerified = null,
    Object? isOnboardingCompleted = null,
    Object? isPremium = null,
    Object? totalFocusTime = null,
    Object? totalSessions = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? dailyGoal = null,
    Object? weeklyGoal = null,
    Object? blockedApps = null,
    Object? allowedApps = null,
    Object? friends = null,
    Object? achievements = null,
    Object? themeMode = null,
    Object? notificationsEnabled = null,
    Object? soundEnabled = null,
    Object? vibrationEnabled = null,
    Object? defaultDifficulty = null,
    Object? defaultSessionDuration = null,
    Object? shortBreakDuration = null,
    Object? longBreakDuration = null,
    Object? lastActiveDate = freezed,
    Object? premiumExpiryDate = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isOnboardingCompleted: null == isOnboardingCompleted
          ? _value.isOnboardingCompleted
          : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      totalFocusTime: null == totalFocusTime
          ? _value.totalFocusTime
          : totalFocusTime // ignore: cast_nullable_to_non_nullable
              as int,
      totalSessions: null == totalSessions
          ? _value.totalSessions
          : totalSessions // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      dailyGoal: null == dailyGoal
          ? _value.dailyGoal
          : dailyGoal // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyGoal: null == weeklyGoal
          ? _value.weeklyGoal
          : weeklyGoal // ignore: cast_nullable_to_non_nullable
              as int,
      blockedApps: null == blockedApps
          ? _value.blockedApps
          : blockedApps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allowedApps: null == allowedApps
          ? _value.allowedApps
          : allowedApps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      friends: null == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<String>,
      achievements: null == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as String,
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      soundEnabled: null == soundEnabled
          ? _value.soundEnabled
          : soundEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      vibrationEnabled: null == vibrationEnabled
          ? _value.vibrationEnabled
          : vibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultDifficulty: null == defaultDifficulty
          ? _value.defaultDifficulty
          : defaultDifficulty // ignore: cast_nullable_to_non_nullable
              as String,
      defaultSessionDuration: null == defaultSessionDuration
          ? _value.defaultSessionDuration
          : defaultSessionDuration // ignore: cast_nullable_to_non_nullable
              as int,
      shortBreakDuration: null == shortBreakDuration
          ? _value.shortBreakDuration
          : shortBreakDuration // ignore: cast_nullable_to_non_nullable
              as int,
      longBreakDuration: null == longBreakDuration
          ? _value.longBreakDuration
          : longBreakDuration // ignore: cast_nullable_to_non_nullable
              as int,
      lastActiveDate: freezed == lastActiveDate
          ? _value.lastActiveDate
          : lastActiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      premiumExpiryDate: freezed == premiumExpiryDate
          ? _value.premiumExpiryDate
          : premiumExpiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String? displayName,
      String? photoUrl,
      String? phoneNumber,
      bool isEmailVerified,
      bool isOnboardingCompleted,
      bool isPremium,
      int totalFocusTime,
      int totalSessions,
      int currentStreak,
      int longestStreak,
      int dailyGoal,
      int weeklyGoal,
      List<String> blockedApps,
      List<String> allowedApps,
      List<String> friends,
      List<String> achievements,
      String themeMode,
      bool notificationsEnabled,
      bool soundEnabled,
      bool vibrationEnabled,
      String defaultDifficulty,
      int defaultSessionDuration,
      int shortBreakDuration,
      int longBreakDuration,
      DateTime? lastActiveDate,
      DateTime? premiumExpiryDate,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
    Object? phoneNumber = freezed,
    Object? isEmailVerified = null,
    Object? isOnboardingCompleted = null,
    Object? isPremium = null,
    Object? totalFocusTime = null,
    Object? totalSessions = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? dailyGoal = null,
    Object? weeklyGoal = null,
    Object? blockedApps = null,
    Object? allowedApps = null,
    Object? friends = null,
    Object? achievements = null,
    Object? themeMode = null,
    Object? notificationsEnabled = null,
    Object? soundEnabled = null,
    Object? vibrationEnabled = null,
    Object? defaultDifficulty = null,
    Object? defaultSessionDuration = null,
    Object? shortBreakDuration = null,
    Object? longBreakDuration = null,
    Object? lastActiveDate = freezed,
    Object? premiumExpiryDate = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isOnboardingCompleted: null == isOnboardingCompleted
          ? _value.isOnboardingCompleted
          : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      totalFocusTime: null == totalFocusTime
          ? _value.totalFocusTime
          : totalFocusTime // ignore: cast_nullable_to_non_nullable
              as int,
      totalSessions: null == totalSessions
          ? _value.totalSessions
          : totalSessions // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      dailyGoal: null == dailyGoal
          ? _value.dailyGoal
          : dailyGoal // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyGoal: null == weeklyGoal
          ? _value.weeklyGoal
          : weeklyGoal // ignore: cast_nullable_to_non_nullable
              as int,
      blockedApps: null == blockedApps
          ? _value._blockedApps
          : blockedApps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allowedApps: null == allowedApps
          ? _value._allowedApps
          : allowedApps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<String>,
      achievements: null == achievements
          ? _value._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as String,
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      soundEnabled: null == soundEnabled
          ? _value.soundEnabled
          : soundEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      vibrationEnabled: null == vibrationEnabled
          ? _value.vibrationEnabled
          : vibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultDifficulty: null == defaultDifficulty
          ? _value.defaultDifficulty
          : defaultDifficulty // ignore: cast_nullable_to_non_nullable
              as String,
      defaultSessionDuration: null == defaultSessionDuration
          ? _value.defaultSessionDuration
          : defaultSessionDuration // ignore: cast_nullable_to_non_nullable
              as int,
      shortBreakDuration: null == shortBreakDuration
          ? _value.shortBreakDuration
          : shortBreakDuration // ignore: cast_nullable_to_non_nullable
              as int,
      longBreakDuration: null == longBreakDuration
          ? _value.longBreakDuration
          : longBreakDuration // ignore: cast_nullable_to_non_nullable
              as int,
      lastActiveDate: freezed == lastActiveDate
          ? _value.lastActiveDate
          : lastActiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      premiumExpiryDate: freezed == premiumExpiryDate
          ? _value.premiumExpiryDate
          : premiumExpiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {required this.id,
      required this.email,
      this.displayName,
      this.photoUrl,
      this.phoneNumber,
      this.isEmailVerified = false,
      this.isOnboardingCompleted = false,
      this.isPremium = false,
      this.totalFocusTime = 0,
      this.totalSessions = 0,
      this.currentStreak = 0,
      this.longestStreak = 0,
      this.dailyGoal = 120,
      this.weeklyGoal = 840,
      final List<String> blockedApps = const [],
      final List<String> allowedApps = const [],
      final List<String> friends = const [],
      final List<String> achievements = const [],
      this.themeMode = 'light',
      this.notificationsEnabled = true,
      this.soundEnabled = true,
      this.vibrationEnabled = true,
      this.defaultDifficulty = 'normal',
      this.defaultSessionDuration = 25,
      this.shortBreakDuration = 5,
      this.longBreakDuration = 15,
      this.lastActiveDate = null,
      this.premiumExpiryDate = null,
      required this.createdAt,
      required this.updatedAt})
      : _blockedApps = blockedApps,
        _allowedApps = allowedApps,
        _friends = friends,
        _achievements = achievements,
        super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? phoneNumber;
  @override
  @JsonKey()
  final bool isEmailVerified;
  @override
  @JsonKey()
  final bool isOnboardingCompleted;
  @override
  @JsonKey()
  final bool isPremium;
  @override
  @JsonKey()
  final int totalFocusTime;
// in minutes
  @override
  @JsonKey()
  final int totalSessions;
  @override
  @JsonKey()
  final int currentStreak;
  @override
  @JsonKey()
  final int longestStreak;
  @override
  @JsonKey()
  final int dailyGoal;
// in minutes
  @override
  @JsonKey()
  final int weeklyGoal;
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

  final List<String> _friends;
  @override
  @JsonKey()
  List<String> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  final List<String> _achievements;
  @override
  @JsonKey()
  List<String> get achievements {
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  @override
  @JsonKey()
  final String themeMode;
  @override
  @JsonKey()
  final bool notificationsEnabled;
  @override
  @JsonKey()
  final bool soundEnabled;
  @override
  @JsonKey()
  final bool vibrationEnabled;
  @override
  @JsonKey()
  final String defaultDifficulty;
  @override
  @JsonKey()
  final int defaultSessionDuration;
// in minutes
  @override
  @JsonKey()
  final int shortBreakDuration;
// in minutes
  @override
  @JsonKey()
  final int longBreakDuration;
// in minutes
  @override
  @JsonKey()
  final DateTime? lastActiveDate;
  @override
  @JsonKey()
  final DateTime? premiumExpiryDate;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, displayName: $displayName, photoUrl: $photoUrl, phoneNumber: $phoneNumber, isEmailVerified: $isEmailVerified, isOnboardingCompleted: $isOnboardingCompleted, isPremium: $isPremium, totalFocusTime: $totalFocusTime, totalSessions: $totalSessions, currentStreak: $currentStreak, longestStreak: $longestStreak, dailyGoal: $dailyGoal, weeklyGoal: $weeklyGoal, blockedApps: $blockedApps, allowedApps: $allowedApps, friends: $friends, achievements: $achievements, themeMode: $themeMode, notificationsEnabled: $notificationsEnabled, soundEnabled: $soundEnabled, vibrationEnabled: $vibrationEnabled, defaultDifficulty: $defaultDifficulty, defaultSessionDuration: $defaultSessionDuration, shortBreakDuration: $shortBreakDuration, longBreakDuration: $longBreakDuration, lastActiveDate: $lastActiveDate, premiumExpiryDate: $premiumExpiryDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.isOnboardingCompleted, isOnboardingCompleted) ||
                other.isOnboardingCompleted == isOnboardingCompleted) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.totalFocusTime, totalFocusTime) ||
                other.totalFocusTime == totalFocusTime) &&
            (identical(other.totalSessions, totalSessions) ||
                other.totalSessions == totalSessions) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.longestStreak, longestStreak) ||
                other.longestStreak == longestStreak) &&
            (identical(other.dailyGoal, dailyGoal) ||
                other.dailyGoal == dailyGoal) &&
            (identical(other.weeklyGoal, weeklyGoal) ||
                other.weeklyGoal == weeklyGoal) &&
            const DeepCollectionEquality()
                .equals(other._blockedApps, _blockedApps) &&
            const DeepCollectionEquality()
                .equals(other._allowedApps, _allowedApps) &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(other.soundEnabled, soundEnabled) ||
                other.soundEnabled == soundEnabled) &&
            (identical(other.vibrationEnabled, vibrationEnabled) ||
                other.vibrationEnabled == vibrationEnabled) &&
            (identical(other.defaultDifficulty, defaultDifficulty) ||
                other.defaultDifficulty == defaultDifficulty) &&
            (identical(other.defaultSessionDuration, defaultSessionDuration) ||
                other.defaultSessionDuration == defaultSessionDuration) &&
            (identical(other.shortBreakDuration, shortBreakDuration) ||
                other.shortBreakDuration == shortBreakDuration) &&
            (identical(other.longBreakDuration, longBreakDuration) ||
                other.longBreakDuration == longBreakDuration) &&
            (identical(other.lastActiveDate, lastActiveDate) ||
                other.lastActiveDate == lastActiveDate) &&
            (identical(other.premiumExpiryDate, premiumExpiryDate) ||
                other.premiumExpiryDate == premiumExpiryDate) &&
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
        email,
        displayName,
        photoUrl,
        phoneNumber,
        isEmailVerified,
        isOnboardingCompleted,
        isPremium,
        totalFocusTime,
        totalSessions,
        currentStreak,
        longestStreak,
        dailyGoal,
        weeklyGoal,
        const DeepCollectionEquality().hash(_blockedApps),
        const DeepCollectionEquality().hash(_allowedApps),
        const DeepCollectionEquality().hash(_friends),
        const DeepCollectionEquality().hash(_achievements),
        themeMode,
        notificationsEnabled,
        soundEnabled,
        vibrationEnabled,
        defaultDifficulty,
        defaultSessionDuration,
        shortBreakDuration,
        longBreakDuration,
        lastActiveDate,
        premiumExpiryDate,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {required final String id,
      required final String email,
      final String? displayName,
      final String? photoUrl,
      final String? phoneNumber,
      final bool isEmailVerified,
      final bool isOnboardingCompleted,
      final bool isPremium,
      final int totalFocusTime,
      final int totalSessions,
      final int currentStreak,
      final int longestStreak,
      final int dailyGoal,
      final int weeklyGoal,
      final List<String> blockedApps,
      final List<String> allowedApps,
      final List<String> friends,
      final List<String> achievements,
      final String themeMode,
      final bool notificationsEnabled,
      final bool soundEnabled,
      final bool vibrationEnabled,
      final String defaultDifficulty,
      final int defaultSessionDuration,
      final int shortBreakDuration,
      final int longBreakDuration,
      final DateTime? lastActiveDate,
      final DateTime? premiumExpiryDate,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String? get displayName;
  @override
  String? get photoUrl;
  @override
  String? get phoneNumber;
  @override
  bool get isEmailVerified;
  @override
  bool get isOnboardingCompleted;
  @override
  bool get isPremium;
  @override
  int get totalFocusTime; // in minutes
  @override
  int get totalSessions;
  @override
  int get currentStreak;
  @override
  int get longestStreak;
  @override
  int get dailyGoal; // in minutes
  @override
  int get weeklyGoal; // in minutes
  @override
  List<String> get blockedApps;
  @override
  List<String> get allowedApps;
  @override
  List<String> get friends;
  @override
  List<String> get achievements;
  @override
  String get themeMode;
  @override
  bool get notificationsEnabled;
  @override
  bool get soundEnabled;
  @override
  bool get vibrationEnabled;
  @override
  String get defaultDifficulty;
  @override
  int get defaultSessionDuration; // in minutes
  @override
  int get shortBreakDuration; // in minutes
  @override
  int get longBreakDuration; // in minutes
  @override
  DateTime? get lastActiveDate;
  @override
  DateTime? get premiumExpiryDate;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
