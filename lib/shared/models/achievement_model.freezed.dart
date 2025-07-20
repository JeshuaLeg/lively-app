// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AchievementModel _$AchievementModelFromJson(Map<String, dynamic> json) {
  return _AchievementModel.fromJson(json);
}

/// @nodoc
mixin _$AchievementModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  AchievementType get type => throw _privateConstructorUsedError;
  AchievementRarity get rarity => throw _privateConstructorUsedError;
  String get iconPath => throw _privateConstructorUsedError;
  int get requiredValue => throw _privateConstructorUsedError;
  int get currentValue => throw _privateConstructorUsedError;
  bool get isUnlocked => throw _privateConstructorUsedError;
  DateTime? get unlockedAt => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  bool get isHidden => throw _privateConstructorUsedError;
  bool get isLimited => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this AchievementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementModelCopyWith<AchievementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementModelCopyWith<$Res> {
  factory $AchievementModelCopyWith(
          AchievementModel value, $Res Function(AchievementModel) then) =
      _$AchievementModelCopyWithImpl<$Res, AchievementModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      AchievementType type,
      AchievementRarity rarity,
      String iconPath,
      int requiredValue,
      int currentValue,
      bool isUnlocked,
      DateTime? unlockedAt,
      DateTime? expiresAt,
      bool isHidden,
      bool isLimited,
      int points,
      List<String> tags,
      Map<String, dynamic> metadata,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$AchievementModelCopyWithImpl<$Res, $Val extends AchievementModel>
    implements $AchievementModelCopyWith<$Res> {
  _$AchievementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? rarity = null,
    Object? iconPath = null,
    Object? requiredValue = null,
    Object? currentValue = null,
    Object? isUnlocked = null,
    Object? unlockedAt = freezed,
    Object? expiresAt = freezed,
    Object? isHidden = null,
    Object? isLimited = null,
    Object? points = null,
    Object? tags = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AchievementType,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as AchievementRarity,
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
      requiredValue: null == requiredValue
          ? _value.requiredValue
          : requiredValue // ignore: cast_nullable_to_non_nullable
              as int,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as int,
      isUnlocked: null == isUnlocked
          ? _value.isUnlocked
          : isUnlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedAt: freezed == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isLimited: null == isLimited
          ? _value.isLimited
          : isLimited // ignore: cast_nullable_to_non_nullable
              as bool,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$AchievementModelImplCopyWith<$Res>
    implements $AchievementModelCopyWith<$Res> {
  factory _$$AchievementModelImplCopyWith(_$AchievementModelImpl value,
          $Res Function(_$AchievementModelImpl) then) =
      __$$AchievementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      AchievementType type,
      AchievementRarity rarity,
      String iconPath,
      int requiredValue,
      int currentValue,
      bool isUnlocked,
      DateTime? unlockedAt,
      DateTime? expiresAt,
      bool isHidden,
      bool isLimited,
      int points,
      List<String> tags,
      Map<String, dynamic> metadata,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$AchievementModelImplCopyWithImpl<$Res>
    extends _$AchievementModelCopyWithImpl<$Res, _$AchievementModelImpl>
    implements _$$AchievementModelImplCopyWith<$Res> {
  __$$AchievementModelImplCopyWithImpl(_$AchievementModelImpl _value,
      $Res Function(_$AchievementModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? rarity = null,
    Object? iconPath = null,
    Object? requiredValue = null,
    Object? currentValue = null,
    Object? isUnlocked = null,
    Object? unlockedAt = freezed,
    Object? expiresAt = freezed,
    Object? isHidden = null,
    Object? isLimited = null,
    Object? points = null,
    Object? tags = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$AchievementModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AchievementType,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as AchievementRarity,
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
      requiredValue: null == requiredValue
          ? _value.requiredValue
          : requiredValue // ignore: cast_nullable_to_non_nullable
              as int,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as int,
      isUnlocked: null == isUnlocked
          ? _value.isUnlocked
          : isUnlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedAt: freezed == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isLimited: null == isLimited
          ? _value.isLimited
          : isLimited // ignore: cast_nullable_to_non_nullable
              as bool,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$AchievementModelImpl extends _AchievementModel {
  const _$AchievementModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.rarity,
      required this.iconPath,
      required this.requiredValue,
      this.currentValue = 0,
      this.isUnlocked = false,
      this.unlockedAt = null,
      this.expiresAt = null,
      this.isHidden = false,
      this.isLimited = false,
      this.points = 0,
      final List<String> tags = const [],
      final Map<String, dynamic> metadata = const {},
      required this.createdAt,
      required this.updatedAt})
      : _tags = tags,
        _metadata = metadata,
        super._();

  factory _$AchievementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchievementModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final AchievementType type;
  @override
  final AchievementRarity rarity;
  @override
  final String iconPath;
  @override
  final int requiredValue;
  @override
  @JsonKey()
  final int currentValue;
  @override
  @JsonKey()
  final bool isUnlocked;
  @override
  @JsonKey()
  final DateTime? unlockedAt;
  @override
  @JsonKey()
  final DateTime? expiresAt;
  @override
  @JsonKey()
  final bool isHidden;
  @override
  @JsonKey()
  final bool isLimited;
  @override
  @JsonKey()
  final int points;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
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
    return 'AchievementModel(id: $id, title: $title, description: $description, type: $type, rarity: $rarity, iconPath: $iconPath, requiredValue: $requiredValue, currentValue: $currentValue, isUnlocked: $isUnlocked, unlockedAt: $unlockedAt, expiresAt: $expiresAt, isHidden: $isHidden, isLimited: $isLimited, points: $points, tags: $tags, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath) &&
            (identical(other.requiredValue, requiredValue) ||
                other.requiredValue == requiredValue) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.isUnlocked, isUnlocked) ||
                other.isUnlocked == isUnlocked) &&
            (identical(other.unlockedAt, unlockedAt) ||
                other.unlockedAt == unlockedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            (identical(other.isLimited, isLimited) ||
                other.isLimited == isLimited) &&
            (identical(other.points, points) || other.points == points) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
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
      title,
      description,
      type,
      rarity,
      iconPath,
      requiredValue,
      currentValue,
      isUnlocked,
      unlockedAt,
      expiresAt,
      isHidden,
      isLimited,
      points,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      updatedAt);

  /// Create a copy of AchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementModelImplCopyWith<_$AchievementModelImpl> get copyWith =>
      __$$AchievementModelImplCopyWithImpl<_$AchievementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementModelImplToJson(
      this,
    );
  }
}

abstract class _AchievementModel extends AchievementModel {
  const factory _AchievementModel(
      {required final String id,
      required final String title,
      required final String description,
      required final AchievementType type,
      required final AchievementRarity rarity,
      required final String iconPath,
      required final int requiredValue,
      final int currentValue,
      final bool isUnlocked,
      final DateTime? unlockedAt,
      final DateTime? expiresAt,
      final bool isHidden,
      final bool isLimited,
      final int points,
      final List<String> tags,
      final Map<String, dynamic> metadata,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$AchievementModelImpl;
  const _AchievementModel._() : super._();

  factory _AchievementModel.fromJson(Map<String, dynamic> json) =
      _$AchievementModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  AchievementType get type;
  @override
  AchievementRarity get rarity;
  @override
  String get iconPath;
  @override
  int get requiredValue;
  @override
  int get currentValue;
  @override
  bool get isUnlocked;
  @override
  DateTime? get unlockedAt;
  @override
  DateTime? get expiresAt;
  @override
  bool get isHidden;
  @override
  bool get isLimited;
  @override
  int get points;
  @override
  List<String> get tags;
  @override
  Map<String, dynamic> get metadata;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of AchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementModelImplCopyWith<_$AchievementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserAchievementModel _$UserAchievementModelFromJson(Map<String, dynamic> json) {
  return _UserAchievementModel.fromJson(json);
}

/// @nodoc
mixin _$UserAchievementModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get achievementId => throw _privateConstructorUsedError;
  AchievementModel get achievement => throw _privateConstructorUsedError;
  int get currentProgress => throw _privateConstructorUsedError;
  bool get isUnlocked => throw _privateConstructorUsedError;
  DateTime? get unlockedAt => throw _privateConstructorUsedError;
  bool get isNotified => throw _privateConstructorUsedError;
  Map<String, dynamic> get progressData => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserAchievementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAchievementModelCopyWith<UserAchievementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAchievementModelCopyWith<$Res> {
  factory $UserAchievementModelCopyWith(UserAchievementModel value,
          $Res Function(UserAchievementModel) then) =
      _$UserAchievementModelCopyWithImpl<$Res, UserAchievementModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String achievementId,
      AchievementModel achievement,
      int currentProgress,
      bool isUnlocked,
      DateTime? unlockedAt,
      bool isNotified,
      Map<String, dynamic> progressData,
      DateTime createdAt,
      DateTime updatedAt});

  $AchievementModelCopyWith<$Res> get achievement;
}

/// @nodoc
class _$UserAchievementModelCopyWithImpl<$Res,
        $Val extends UserAchievementModel>
    implements $UserAchievementModelCopyWith<$Res> {
  _$UserAchievementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? achievementId = null,
    Object? achievement = null,
    Object? currentProgress = null,
    Object? isUnlocked = null,
    Object? unlockedAt = freezed,
    Object? isNotified = null,
    Object? progressData = null,
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
      achievementId: null == achievementId
          ? _value.achievementId
          : achievementId // ignore: cast_nullable_to_non_nullable
              as String,
      achievement: null == achievement
          ? _value.achievement
          : achievement // ignore: cast_nullable_to_non_nullable
              as AchievementModel,
      currentProgress: null == currentProgress
          ? _value.currentProgress
          : currentProgress // ignore: cast_nullable_to_non_nullable
              as int,
      isUnlocked: null == isUnlocked
          ? _value.isUnlocked
          : isUnlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedAt: freezed == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isNotified: null == isNotified
          ? _value.isNotified
          : isNotified // ignore: cast_nullable_to_non_nullable
              as bool,
      progressData: null == progressData
          ? _value.progressData
          : progressData // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of UserAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AchievementModelCopyWith<$Res> get achievement {
    return $AchievementModelCopyWith<$Res>(_value.achievement, (value) {
      return _then(_value.copyWith(achievement: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserAchievementModelImplCopyWith<$Res>
    implements $UserAchievementModelCopyWith<$Res> {
  factory _$$UserAchievementModelImplCopyWith(_$UserAchievementModelImpl value,
          $Res Function(_$UserAchievementModelImpl) then) =
      __$$UserAchievementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String achievementId,
      AchievementModel achievement,
      int currentProgress,
      bool isUnlocked,
      DateTime? unlockedAt,
      bool isNotified,
      Map<String, dynamic> progressData,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $AchievementModelCopyWith<$Res> get achievement;
}

/// @nodoc
class __$$UserAchievementModelImplCopyWithImpl<$Res>
    extends _$UserAchievementModelCopyWithImpl<$Res, _$UserAchievementModelImpl>
    implements _$$UserAchievementModelImplCopyWith<$Res> {
  __$$UserAchievementModelImplCopyWithImpl(_$UserAchievementModelImpl _value,
      $Res Function(_$UserAchievementModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? achievementId = null,
    Object? achievement = null,
    Object? currentProgress = null,
    Object? isUnlocked = null,
    Object? unlockedAt = freezed,
    Object? isNotified = null,
    Object? progressData = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserAchievementModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      achievementId: null == achievementId
          ? _value.achievementId
          : achievementId // ignore: cast_nullable_to_non_nullable
              as String,
      achievement: null == achievement
          ? _value.achievement
          : achievement // ignore: cast_nullable_to_non_nullable
              as AchievementModel,
      currentProgress: null == currentProgress
          ? _value.currentProgress
          : currentProgress // ignore: cast_nullable_to_non_nullable
              as int,
      isUnlocked: null == isUnlocked
          ? _value.isUnlocked
          : isUnlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedAt: freezed == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isNotified: null == isNotified
          ? _value.isNotified
          : isNotified // ignore: cast_nullable_to_non_nullable
              as bool,
      progressData: null == progressData
          ? _value._progressData
          : progressData // ignore: cast_nullable_to_non_nullable
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
class _$UserAchievementModelImpl extends _UserAchievementModel {
  const _$UserAchievementModelImpl(
      {required this.id,
      required this.userId,
      required this.achievementId,
      required this.achievement,
      this.currentProgress = 0,
      this.isUnlocked = false,
      this.unlockedAt = null,
      this.isNotified = false,
      final Map<String, dynamic> progressData = const {},
      required this.createdAt,
      required this.updatedAt})
      : _progressData = progressData,
        super._();

  factory _$UserAchievementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAchievementModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String achievementId;
  @override
  final AchievementModel achievement;
  @override
  @JsonKey()
  final int currentProgress;
  @override
  @JsonKey()
  final bool isUnlocked;
  @override
  @JsonKey()
  final DateTime? unlockedAt;
  @override
  @JsonKey()
  final bool isNotified;
  final Map<String, dynamic> _progressData;
  @override
  @JsonKey()
  Map<String, dynamic> get progressData {
    if (_progressData is EqualUnmodifiableMapView) return _progressData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_progressData);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserAchievementModel(id: $id, userId: $userId, achievementId: $achievementId, achievement: $achievement, currentProgress: $currentProgress, isUnlocked: $isUnlocked, unlockedAt: $unlockedAt, isNotified: $isNotified, progressData: $progressData, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAchievementModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.achievementId, achievementId) ||
                other.achievementId == achievementId) &&
            (identical(other.achievement, achievement) ||
                other.achievement == achievement) &&
            (identical(other.currentProgress, currentProgress) ||
                other.currentProgress == currentProgress) &&
            (identical(other.isUnlocked, isUnlocked) ||
                other.isUnlocked == isUnlocked) &&
            (identical(other.unlockedAt, unlockedAt) ||
                other.unlockedAt == unlockedAt) &&
            (identical(other.isNotified, isNotified) ||
                other.isNotified == isNotified) &&
            const DeepCollectionEquality()
                .equals(other._progressData, _progressData) &&
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
      achievementId,
      achievement,
      currentProgress,
      isUnlocked,
      unlockedAt,
      isNotified,
      const DeepCollectionEquality().hash(_progressData),
      createdAt,
      updatedAt);

  /// Create a copy of UserAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAchievementModelImplCopyWith<_$UserAchievementModelImpl>
      get copyWith =>
          __$$UserAchievementModelImplCopyWithImpl<_$UserAchievementModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAchievementModelImplToJson(
      this,
    );
  }
}

abstract class _UserAchievementModel extends UserAchievementModel {
  const factory _UserAchievementModel(
      {required final String id,
      required final String userId,
      required final String achievementId,
      required final AchievementModel achievement,
      final int currentProgress,
      final bool isUnlocked,
      final DateTime? unlockedAt,
      final bool isNotified,
      final Map<String, dynamic> progressData,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$UserAchievementModelImpl;
  const _UserAchievementModel._() : super._();

  factory _UserAchievementModel.fromJson(Map<String, dynamic> json) =
      _$UserAchievementModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get achievementId;
  @override
  AchievementModel get achievement;
  @override
  int get currentProgress;
  @override
  bool get isUnlocked;
  @override
  DateTime? get unlockedAt;
  @override
  bool get isNotified;
  @override
  Map<String, dynamic> get progressData;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of UserAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAchievementModelImplCopyWith<_$UserAchievementModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
