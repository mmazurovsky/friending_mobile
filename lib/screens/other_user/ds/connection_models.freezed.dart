// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConnectionModel _$ConnectionModelFromJson(Map<String, dynamic> json) {
  return _ConnectionModel.fromJson(json);
}

/// @nodoc
mixin _$ConnectionModel {
  String get userId => throw _privateConstructorUsedError;
  UserPairStatusEnum get status => throw _privateConstructorUsedError;
  DateTime get createdDateTime => throw _privateConstructorUsedError;
  DateTime? get endedDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConnectionModelCopyWith<ConnectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionModelCopyWith<$Res> {
  factory $ConnectionModelCopyWith(
          ConnectionModel value, $Res Function(ConnectionModel) then) =
      _$ConnectionModelCopyWithImpl<$Res, ConnectionModel>;
  @useResult
  $Res call(
      {String userId,
      UserPairStatusEnum status,
      DateTime createdDateTime,
      DateTime? endedDateTime});
}

/// @nodoc
class _$ConnectionModelCopyWithImpl<$Res, $Val extends ConnectionModel>
    implements $ConnectionModelCopyWith<$Res> {
  _$ConnectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? status = null,
    Object? createdDateTime = null,
    Object? endedDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserPairStatusEnum,
      createdDateTime: null == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedDateTime: freezed == endedDateTime
          ? _value.endedDateTime
          : endedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConnectionModelCopyWith<$Res>
    implements $ConnectionModelCopyWith<$Res> {
  factory _$$_ConnectionModelCopyWith(
          _$_ConnectionModel value, $Res Function(_$_ConnectionModel) then) =
      __$$_ConnectionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      UserPairStatusEnum status,
      DateTime createdDateTime,
      DateTime? endedDateTime});
}

/// @nodoc
class __$$_ConnectionModelCopyWithImpl<$Res>
    extends _$ConnectionModelCopyWithImpl<$Res, _$_ConnectionModel>
    implements _$$_ConnectionModelCopyWith<$Res> {
  __$$_ConnectionModelCopyWithImpl(
      _$_ConnectionModel _value, $Res Function(_$_ConnectionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? status = null,
    Object? createdDateTime = null,
    Object? endedDateTime = freezed,
  }) {
    return _then(_$_ConnectionModel(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserPairStatusEnum,
      createdDateTime: null == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endedDateTime: freezed == endedDateTime
          ? _value.endedDateTime
          : endedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConnectionModel extends _ConnectionModel {
  const _$_ConnectionModel(
      {required this.userId,
      required this.status,
      required this.createdDateTime,
      this.endedDateTime})
      : super._();

  factory _$_ConnectionModel.fromJson(Map<String, dynamic> json) =>
      _$$_ConnectionModelFromJson(json);

  @override
  final String userId;
  @override
  final UserPairStatusEnum status;
  @override
  final DateTime createdDateTime;
  @override
  final DateTime? endedDateTime;

  @override
  String toString() {
    return 'ConnectionModel(userId: $userId, status: $status, createdDateTime: $createdDateTime, endedDateTime: $endedDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectionModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdDateTime, createdDateTime) ||
                other.createdDateTime == createdDateTime) &&
            (identical(other.endedDateTime, endedDateTime) ||
                other.endedDateTime == endedDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, status, createdDateTime, endedDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectionModelCopyWith<_$_ConnectionModel> get copyWith =>
      __$$_ConnectionModelCopyWithImpl<_$_ConnectionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConnectionModelToJson(
      this,
    );
  }
}

abstract class _ConnectionModel extends ConnectionModel {
  const factory _ConnectionModel(
      {required final String userId,
      required final UserPairStatusEnum status,
      required final DateTime createdDateTime,
      final DateTime? endedDateTime}) = _$_ConnectionModel;
  const _ConnectionModel._() : super._();

  factory _ConnectionModel.fromJson(Map<String, dynamic> json) =
      _$_ConnectionModel.fromJson;

  @override
  String get userId;
  @override
  UserPairStatusEnum get status;
  @override
  DateTime get createdDateTime;
  @override
  DateTime? get endedDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectionModelCopyWith<_$_ConnectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
