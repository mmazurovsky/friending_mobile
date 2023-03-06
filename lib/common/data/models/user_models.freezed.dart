// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FullUserModel _$FullUserModelFromJson(Map<String, dynamic> json) {
  return _FullUserModel.fromJson(json);
}

/// @nodoc
mixin _$FullUserModel {
  String get id => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;
  UserConnectStatusEnum get connectStatus => throw _privateConstructorUsedError;
  List<UserGoalsEnum> get goals => throw _privateConstructorUsedError;
  List<String> get interests => throw _privateConstructorUsedError;
  DateTime get birthDate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get instagramUsername => throw _privateConstructorUsedError;
  String? get telegramUsername => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FullUserModelCopyWith<FullUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullUserModelCopyWith<$Res> {
  factory $FullUserModelCopyWith(
          FullUserModel value, $Res Function(FullUserModel) then) =
      _$FullUserModelCopyWithImpl<$Res, FullUserModel>;
  @useResult
  $Res call(
      {String id,
      String nickname,
      List<String> photos,
      UserConnectStatusEnum connectStatus,
      List<UserGoalsEnum> goals,
      List<String> interests,
      DateTime birthDate,
      String? description,
      String? instagramUsername,
      String? telegramUsername});
}

/// @nodoc
class _$FullUserModelCopyWithImpl<$Res, $Val extends FullUserModel>
    implements $FullUserModelCopyWith<$Res> {
  _$FullUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? photos = null,
    Object? connectStatus = null,
    Object? goals = null,
    Object? interests = null,
    Object? birthDate = null,
    Object? description = freezed,
    Object? instagramUsername = freezed,
    Object? telegramUsername = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      connectStatus: null == connectStatus
          ? _value.connectStatus
          : connectStatus // ignore: cast_nullable_to_non_nullable
              as UserConnectStatusEnum,
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<UserGoalsEnum>,
      interests: null == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<String>,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      instagramUsername: freezed == instagramUsername
          ? _value.instagramUsername
          : instagramUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      telegramUsername: freezed == telegramUsername
          ? _value.telegramUsername
          : telegramUsername // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FullUserModelCopyWith<$Res>
    implements $FullUserModelCopyWith<$Res> {
  factory _$$_FullUserModelCopyWith(
          _$_FullUserModel value, $Res Function(_$_FullUserModel) then) =
      __$$_FullUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nickname,
      List<String> photos,
      UserConnectStatusEnum connectStatus,
      List<UserGoalsEnum> goals,
      List<String> interests,
      DateTime birthDate,
      String? description,
      String? instagramUsername,
      String? telegramUsername});
}

/// @nodoc
class __$$_FullUserModelCopyWithImpl<$Res>
    extends _$FullUserModelCopyWithImpl<$Res, _$_FullUserModel>
    implements _$$_FullUserModelCopyWith<$Res> {
  __$$_FullUserModelCopyWithImpl(
      _$_FullUserModel _value, $Res Function(_$_FullUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? photos = null,
    Object? connectStatus = null,
    Object? goals = null,
    Object? interests = null,
    Object? birthDate = null,
    Object? description = freezed,
    Object? instagramUsername = freezed,
    Object? telegramUsername = freezed,
  }) {
    return _then(_$_FullUserModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      connectStatus: null == connectStatus
          ? _value.connectStatus
          : connectStatus // ignore: cast_nullable_to_non_nullable
              as UserConnectStatusEnum,
      goals: null == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<UserGoalsEnum>,
      interests: null == interests
          ? _value._interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<String>,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      instagramUsername: freezed == instagramUsername
          ? _value.instagramUsername
          : instagramUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      telegramUsername: freezed == telegramUsername
          ? _value.telegramUsername
          : telegramUsername // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FullUserModel extends _FullUserModel {
  const _$_FullUserModel(
      {required this.id,
      required this.nickname,
      required final List<String> photos,
      required this.connectStatus,
      required final List<UserGoalsEnum> goals,
      required final List<String> interests,
      required this.birthDate,
      this.description,
      this.instagramUsername,
      this.telegramUsername})
      : _photos = photos,
        _goals = goals,
        _interests = interests,
        super._();

  factory _$_FullUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_FullUserModelFromJson(json);

  @override
  final String id;
  @override
  final String nickname;
  final List<String> _photos;
  @override
  List<String> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  final UserConnectStatusEnum connectStatus;
  final List<UserGoalsEnum> _goals;
  @override
  List<UserGoalsEnum> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  final List<String> _interests;
  @override
  List<String> get interests {
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interests);
  }

  @override
  final DateTime birthDate;
  @override
  final String? description;
  @override
  final String? instagramUsername;
  @override
  final String? telegramUsername;

  @override
  String toString() {
    return 'FullUserModel(id: $id, nickname: $nickname, photos: $photos, connectStatus: $connectStatus, goals: $goals, interests: $interests, birthDate: $birthDate, description: $description, instagramUsername: $instagramUsername, telegramUsername: $telegramUsername)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FullUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.connectStatus, connectStatus) ||
                other.connectStatus == connectStatus) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            const DeepCollectionEquality()
                .equals(other._interests, _interests) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.instagramUsername, instagramUsername) ||
                other.instagramUsername == instagramUsername) &&
            (identical(other.telegramUsername, telegramUsername) ||
                other.telegramUsername == telegramUsername));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nickname,
      const DeepCollectionEquality().hash(_photos),
      connectStatus,
      const DeepCollectionEquality().hash(_goals),
      const DeepCollectionEquality().hash(_interests),
      birthDate,
      description,
      instagramUsername,
      telegramUsername);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FullUserModelCopyWith<_$_FullUserModel> get copyWith =>
      __$$_FullUserModelCopyWithImpl<_$_FullUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FullUserModelToJson(
      this,
    );
  }
}

abstract class _FullUserModel extends FullUserModel {
  const factory _FullUserModel(
      {required final String id,
      required final String nickname,
      required final List<String> photos,
      required final UserConnectStatusEnum connectStatus,
      required final List<UserGoalsEnum> goals,
      required final List<String> interests,
      required final DateTime birthDate,
      final String? description,
      final String? instagramUsername,
      final String? telegramUsername}) = _$_FullUserModel;
  const _FullUserModel._() : super._();

  factory _FullUserModel.fromJson(Map<String, dynamic> json) =
      _$_FullUserModel.fromJson;

  @override
  String get id;
  @override
  String get nickname;
  @override
  List<String> get photos;
  @override
  UserConnectStatusEnum get connectStatus;
  @override
  List<UserGoalsEnum> get goals;
  @override
  List<String> get interests;
  @override
  DateTime get birthDate;
  @override
  String? get description;
  @override
  String? get instagramUsername;
  @override
  String? get telegramUsername;
  @override
  @JsonKey(ignore: true)
  _$$_FullUserModelCopyWith<_$_FullUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
