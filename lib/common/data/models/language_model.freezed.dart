// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) {
  return _LanguageModel.fromJson(json);
}

/// @nodoc
mixin _$LanguageModel {
  String get name => throw _privateConstructorUsedError;
  String get emojiCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguageModelCopyWith<LanguageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageModelCopyWith<$Res> {
  factory $LanguageModelCopyWith(
          LanguageModel value, $Res Function(LanguageModel) then) =
      _$LanguageModelCopyWithImpl<$Res, LanguageModel>;
  @useResult
  $Res call({String name, String emojiCode});
}

/// @nodoc
class _$LanguageModelCopyWithImpl<$Res, $Val extends LanguageModel>
    implements $LanguageModelCopyWith<$Res> {
  _$LanguageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? emojiCode = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      emojiCode: null == emojiCode
          ? _value.emojiCode
          : emojiCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LanguageModelCopyWith<$Res>
    implements $LanguageModelCopyWith<$Res> {
  factory _$$_LanguageModelCopyWith(
          _$_LanguageModel value, $Res Function(_$_LanguageModel) then) =
      __$$_LanguageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String emojiCode});
}

/// @nodoc
class __$$_LanguageModelCopyWithImpl<$Res>
    extends _$LanguageModelCopyWithImpl<$Res, _$_LanguageModel>
    implements _$$_LanguageModelCopyWith<$Res> {
  __$$_LanguageModelCopyWithImpl(
      _$_LanguageModel _value, $Res Function(_$_LanguageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? emojiCode = null,
  }) {
    return _then(_$_LanguageModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      emojiCode: null == emojiCode
          ? _value.emojiCode
          : emojiCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LanguageModel extends _LanguageModel {
  const _$_LanguageModel({required this.name, required this.emojiCode})
      : super._();

  factory _$_LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$$_LanguageModelFromJson(json);

  @override
  final String name;
  @override
  final String emojiCode;

  @override
  String toString() {
    return 'LanguageModel(name: $name, emojiCode: $emojiCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LanguageModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.emojiCode, emojiCode) ||
                other.emojiCode == emojiCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, emojiCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LanguageModelCopyWith<_$_LanguageModel> get copyWith =>
      __$$_LanguageModelCopyWithImpl<_$_LanguageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LanguageModelToJson(
      this,
    );
  }
}

abstract class _LanguageModel extends LanguageModel {
  const factory _LanguageModel(
      {required final String name,
      required final String emojiCode}) = _$_LanguageModel;
  const _LanguageModel._() : super._();

  factory _LanguageModel.fromJson(Map<String, dynamic> json) =
      _$_LanguageModel.fromJson;

  @override
  String get name;
  @override
  String get emojiCode;
  @override
  @JsonKey(ignore: true)
  _$$_LanguageModelCopyWith<_$_LanguageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
