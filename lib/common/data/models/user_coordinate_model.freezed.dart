// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_coordinate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserCoordinateModel _$UserCoordinateModelFromJson(Map<String, dynamic> json) {
  return _CoordinateModel.fromJson(json);
}

/// @nodoc
mixin _$UserCoordinateModel {
  DateTime get dateTime => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get long => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCoordinateModelCopyWith<UserCoordinateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCoordinateModelCopyWith<$Res> {
  factory $UserCoordinateModelCopyWith(
          UserCoordinateModel value, $Res Function(UserCoordinateModel) then) =
      _$UserCoordinateModelCopyWithImpl<$Res, UserCoordinateModel>;
  @useResult
  $Res call({DateTime dateTime, double lat, double long, String userId});
}

/// @nodoc
class _$UserCoordinateModelCopyWithImpl<$Res, $Val extends UserCoordinateModel>
    implements $UserCoordinateModelCopyWith<$Res> {
  _$UserCoordinateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? lat = null,
    Object? long = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoordinateModelCopyWith<$Res>
    implements $UserCoordinateModelCopyWith<$Res> {
  factory _$$_CoordinateModelCopyWith(
          _$_CoordinateModel value, $Res Function(_$_CoordinateModel) then) =
      __$$_CoordinateModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime dateTime, double lat, double long, String userId});
}

/// @nodoc
class __$$_CoordinateModelCopyWithImpl<$Res>
    extends _$UserCoordinateModelCopyWithImpl<$Res, _$_CoordinateModel>
    implements _$$_CoordinateModelCopyWith<$Res> {
  __$$_CoordinateModelCopyWithImpl(
      _$_CoordinateModel _value, $Res Function(_$_CoordinateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? lat = null,
    Object? long = null,
    Object? userId = null,
  }) {
    return _then(_$_CoordinateModel(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoordinateModel extends _CoordinateModel {
  const _$_CoordinateModel(
      {required this.dateTime,
      required this.lat,
      required this.long,
      required this.userId})
      : super._();

  factory _$_CoordinateModel.fromJson(Map<String, dynamic> json) =>
      _$$_CoordinateModelFromJson(json);

  @override
  final DateTime dateTime;
  @override
  final double lat;
  @override
  final double long;
  @override
  final String userId;

  @override
  String toString() {
    return 'UserCoordinateModel(dateTime: $dateTime, lat: $lat, long: $long, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoordinateModel &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dateTime, lat, long, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoordinateModelCopyWith<_$_CoordinateModel> get copyWith =>
      __$$_CoordinateModelCopyWithImpl<_$_CoordinateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoordinateModelToJson(
      this,
    );
  }
}

abstract class _CoordinateModel extends UserCoordinateModel {
  const factory _CoordinateModel(
      {required final DateTime dateTime,
      required final double lat,
      required final double long,
      required final String userId}) = _$_CoordinateModel;
  const _CoordinateModel._() : super._();

  factory _CoordinateModel.fromJson(Map<String, dynamic> json) =
      _$_CoordinateModel.fromJson;

  @override
  DateTime get dateTime;
  @override
  double get lat;
  @override
  double get long;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$_CoordinateModelCopyWith<_$_CoordinateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
