// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserEventModel _$UserEventModelFromJson(Map<String, dynamic> json) {
  return _UserEventModel.fromJson(json);
}

/// @nodoc
mixin _$UserEventModel {
  String get ownerUserId => throw _privateConstructorUsedError;
  VeryShortUserModel get otherUser => throw _privateConstructorUsedError;
  bool get isNew => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  UserEventTypeEnum get eventType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEventModelCopyWith<UserEventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventModelCopyWith<$Res> {
  factory $UserEventModelCopyWith(
          UserEventModel value, $Res Function(UserEventModel) then) =
      _$UserEventModelCopyWithImpl<$Res, UserEventModel>;
  @useResult
  $Res call(
      {String ownerUserId,
      VeryShortUserModel otherUser,
      bool isNew,
      DateTime dateTime,
      UserEventTypeEnum eventType});

  $VeryShortUserModelCopyWith<$Res> get otherUser;
}

/// @nodoc
class _$UserEventModelCopyWithImpl<$Res, $Val extends UserEventModel>
    implements $UserEventModelCopyWith<$Res> {
  _$UserEventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerUserId = null,
    Object? otherUser = null,
    Object? isNew = null,
    Object? dateTime = null,
    Object? eventType = null,
  }) {
    return _then(_value.copyWith(
      ownerUserId: null == ownerUserId
          ? _value.ownerUserId
          : ownerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      otherUser: null == otherUser
          ? _value.otherUser
          : otherUser // ignore: cast_nullable_to_non_nullable
              as VeryShortUserModel,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as UserEventTypeEnum,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VeryShortUserModelCopyWith<$Res> get otherUser {
    return $VeryShortUserModelCopyWith<$Res>(_value.otherUser, (value) {
      return _then(_value.copyWith(otherUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserEventModelCopyWith<$Res>
    implements $UserEventModelCopyWith<$Res> {
  factory _$$_UserEventModelCopyWith(
          _$_UserEventModel value, $Res Function(_$_UserEventModel) then) =
      __$$_UserEventModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ownerUserId,
      VeryShortUserModel otherUser,
      bool isNew,
      DateTime dateTime,
      UserEventTypeEnum eventType});

  @override
  $VeryShortUserModelCopyWith<$Res> get otherUser;
}

/// @nodoc
class __$$_UserEventModelCopyWithImpl<$Res>
    extends _$UserEventModelCopyWithImpl<$Res, _$_UserEventModel>
    implements _$$_UserEventModelCopyWith<$Res> {
  __$$_UserEventModelCopyWithImpl(
      _$_UserEventModel _value, $Res Function(_$_UserEventModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerUserId = null,
    Object? otherUser = null,
    Object? isNew = null,
    Object? dateTime = null,
    Object? eventType = null,
  }) {
    return _then(_$_UserEventModel(
      ownerUserId: null == ownerUserId
          ? _value.ownerUserId
          : ownerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      otherUser: null == otherUser
          ? _value.otherUser
          : otherUser // ignore: cast_nullable_to_non_nullable
              as VeryShortUserModel,
      isNew: null == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as UserEventTypeEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserEventModel extends _UserEventModel {
  const _$_UserEventModel(
      {required this.ownerUserId,
      required this.otherUser,
      required this.isNew,
      required this.dateTime,
      required this.eventType})
      : super._();

  factory _$_UserEventModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserEventModelFromJson(json);

  @override
  final String ownerUserId;
  @override
  final VeryShortUserModel otherUser;
  @override
  final bool isNew;
  @override
  final DateTime dateTime;
  @override
  final UserEventTypeEnum eventType;

  @override
  String toString() {
    return 'UserEventModel(ownerUserId: $ownerUserId, otherUser: $otherUser, isNew: $isNew, dateTime: $dateTime, eventType: $eventType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserEventModel &&
            (identical(other.ownerUserId, ownerUserId) ||
                other.ownerUserId == ownerUserId) &&
            (identical(other.otherUser, otherUser) ||
                other.otherUser == otherUser) &&
            (identical(other.isNew, isNew) || other.isNew == isNew) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, ownerUserId, otherUser, isNew, dateTime, eventType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserEventModelCopyWith<_$_UserEventModel> get copyWith =>
      __$$_UserEventModelCopyWithImpl<_$_UserEventModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserEventModelToJson(
      this,
    );
  }
}

abstract class _UserEventModel extends UserEventModel {
  const factory _UserEventModel(
      {required final String ownerUserId,
      required final VeryShortUserModel otherUser,
      required final bool isNew,
      required final DateTime dateTime,
      required final UserEventTypeEnum eventType}) = _$_UserEventModel;
  const _UserEventModel._() : super._();

  factory _UserEventModel.fromJson(Map<String, dynamic> json) =
      _$_UserEventModel.fromJson;

  @override
  String get ownerUserId;
  @override
  VeryShortUserModel get otherUser;
  @override
  bool get isNew;
  @override
  DateTime get dateTime;
  @override
  UserEventTypeEnum get eventType;
  @override
  @JsonKey(ignore: true)
  _$$_UserEventModelCopyWith<_$_UserEventModel> get copyWith =>
      throw _privateConstructorUsedError;
}
