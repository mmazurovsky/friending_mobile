// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PointModel _$PointModelFromJson(Map<String, dynamic> json) {
  return _PointModel.fromJson(json);
}

/// @nodoc
mixin _$PointModel {
  double get lat => throw _privateConstructorUsedError;
  double get long => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointModelCopyWith<PointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointModelCopyWith<$Res> {
  factory $PointModelCopyWith(
          PointModel value, $Res Function(PointModel) then) =
      _$PointModelCopyWithImpl<$Res, PointModel>;
  @useResult
  $Res call({double lat, double long});
}

/// @nodoc
class _$PointModelCopyWithImpl<$Res, $Val extends PointModel>
    implements $PointModelCopyWith<$Res> {
  _$PointModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? long = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PointModelCopyWith<$Res>
    implements $PointModelCopyWith<$Res> {
  factory _$$_PointModelCopyWith(
          _$_PointModel value, $Res Function(_$_PointModel) then) =
      __$$_PointModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double long});
}

/// @nodoc
class __$$_PointModelCopyWithImpl<$Res>
    extends _$PointModelCopyWithImpl<$Res, _$_PointModel>
    implements _$$_PointModelCopyWith<$Res> {
  __$$_PointModelCopyWithImpl(
      _$_PointModel _value, $Res Function(_$_PointModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? long = null,
  }) {
    return _then(_$_PointModel(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PointModel extends _PointModel {
  const _$_PointModel({required this.lat, required this.long}) : super._();

  factory _$_PointModel.fromJson(Map<String, dynamic> json) =>
      _$$_PointModelFromJson(json);

  @override
  final double lat;
  @override
  final double long;

  @override
  String toString() {
    return 'PointModel(lat: $lat, long: $long)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PointModel &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, long);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PointModelCopyWith<_$_PointModel> get copyWith =>
      __$$_PointModelCopyWithImpl<_$_PointModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PointModelToJson(
      this,
    );
  }
}

abstract class _PointModel extends PointModel {
  const factory _PointModel(
      {required final double lat, required final double long}) = _$_PointModel;
  const _PointModel._() : super._();

  factory _PointModel.fromJson(Map<String, dynamic> json) =
      _$_PointModel.fromJson;

  @override
  double get lat;
  @override
  double get long;
  @override
  @JsonKey(ignore: true)
  _$$_PointModelCopyWith<_$_PointModel> get copyWith =>
      throw _privateConstructorUsedError;
}
