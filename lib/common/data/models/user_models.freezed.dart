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

/// @nodoc
mixin _$FullUserModel {
  ShortUserModel get shortUserModel => throw _privateConstructorUsedError;
  AdditionalUserModel get additionalUserModel =>
      throw _privateConstructorUsedError;
  PrivateInfoUserModel get privateInfoUserModel =>
      throw _privateConstructorUsedError;

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
      {ShortUserModel shortUserModel,
      AdditionalUserModel additionalUserModel,
      PrivateInfoUserModel privateInfoUserModel});

  $ShortUserModelCopyWith<$Res> get shortUserModel;
  $AdditionalUserModelCopyWith<$Res> get additionalUserModel;
  $PrivateInfoUserModelCopyWith<$Res> get privateInfoUserModel;
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
    Object? shortUserModel = null,
    Object? additionalUserModel = null,
    Object? privateInfoUserModel = null,
  }) {
    return _then(_value.copyWith(
      shortUserModel: null == shortUserModel
          ? _value.shortUserModel
          : shortUserModel // ignore: cast_nullable_to_non_nullable
              as ShortUserModel,
      additionalUserModel: null == additionalUserModel
          ? _value.additionalUserModel
          : additionalUserModel // ignore: cast_nullable_to_non_nullable
              as AdditionalUserModel,
      privateInfoUserModel: null == privateInfoUserModel
          ? _value.privateInfoUserModel
          : privateInfoUserModel // ignore: cast_nullable_to_non_nullable
              as PrivateInfoUserModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShortUserModelCopyWith<$Res> get shortUserModel {
    return $ShortUserModelCopyWith<$Res>(_value.shortUserModel, (value) {
      return _then(_value.copyWith(shortUserModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AdditionalUserModelCopyWith<$Res> get additionalUserModel {
    return $AdditionalUserModelCopyWith<$Res>(_value.additionalUserModel,
        (value) {
      return _then(_value.copyWith(additionalUserModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PrivateInfoUserModelCopyWith<$Res> get privateInfoUserModel {
    return $PrivateInfoUserModelCopyWith<$Res>(_value.privateInfoUserModel,
        (value) {
      return _then(_value.copyWith(privateInfoUserModel: value) as $Val);
    });
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
      {ShortUserModel shortUserModel,
      AdditionalUserModel additionalUserModel,
      PrivateInfoUserModel privateInfoUserModel});

  @override
  $ShortUserModelCopyWith<$Res> get shortUserModel;
  @override
  $AdditionalUserModelCopyWith<$Res> get additionalUserModel;
  @override
  $PrivateInfoUserModelCopyWith<$Res> get privateInfoUserModel;
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
    Object? shortUserModel = null,
    Object? additionalUserModel = null,
    Object? privateInfoUserModel = null,
  }) {
    return _then(_$_FullUserModel(
      shortUserModel: null == shortUserModel
          ? _value.shortUserModel
          : shortUserModel // ignore: cast_nullable_to_non_nullable
              as ShortUserModel,
      additionalUserModel: null == additionalUserModel
          ? _value.additionalUserModel
          : additionalUserModel // ignore: cast_nullable_to_non_nullable
              as AdditionalUserModel,
      privateInfoUserModel: null == privateInfoUserModel
          ? _value.privateInfoUserModel
          : privateInfoUserModel // ignore: cast_nullable_to_non_nullable
              as PrivateInfoUserModel,
    ));
  }
}

/// @nodoc

class _$_FullUserModel extends _FullUserModel {
  const _$_FullUserModel(
      {required this.shortUserModel,
      required this.additionalUserModel,
      required this.privateInfoUserModel})
      : super._();

  @override
  final ShortUserModel shortUserModel;
  @override
  final AdditionalUserModel additionalUserModel;
  @override
  final PrivateInfoUserModel privateInfoUserModel;

  @override
  String toString() {
    return 'FullUserModel(shortUserModel: $shortUserModel, additionalUserModel: $additionalUserModel, privateInfoUserModel: $privateInfoUserModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FullUserModel &&
            (identical(other.shortUserModel, shortUserModel) ||
                other.shortUserModel == shortUserModel) &&
            (identical(other.additionalUserModel, additionalUserModel) ||
                other.additionalUserModel == additionalUserModel) &&
            (identical(other.privateInfoUserModel, privateInfoUserModel) ||
                other.privateInfoUserModel == privateInfoUserModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, shortUserModel, additionalUserModel, privateInfoUserModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FullUserModelCopyWith<_$_FullUserModel> get copyWith =>
      __$$_FullUserModelCopyWithImpl<_$_FullUserModel>(this, _$identity);
}

abstract class _FullUserModel extends FullUserModel {
  const factory _FullUserModel(
          {required final ShortUserModel shortUserModel,
          required final AdditionalUserModel additionalUserModel,
          required final PrivateInfoUserModel privateInfoUserModel}) =
      _$_FullUserModel;
  const _FullUserModel._() : super._();

  @override
  ShortUserModel get shortUserModel;
  @override
  AdditionalUserModel get additionalUserModel;
  @override
  PrivateInfoUserModel get privateInfoUserModel;
  @override
  @JsonKey(ignore: true)
  _$$_FullUserModelCopyWith<_$_FullUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OtherUserFullModel {
  ShortUserModel get shortUserModel => throw _privateConstructorUsedError;
  AdditionalUserModel get additionalUserModel =>
      throw _privateConstructorUsedError;
  PrivateInfoUserModel? get privateInfoUserModel =>
      throw _privateConstructorUsedError;
  UserConnectStatusEnum get connectStatusEnum =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtherUserFullModelCopyWith<OtherUserFullModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherUserFullModelCopyWith<$Res> {
  factory $OtherUserFullModelCopyWith(
          OtherUserFullModel value, $Res Function(OtherUserFullModel) then) =
      _$OtherUserFullModelCopyWithImpl<$Res, OtherUserFullModel>;
  @useResult
  $Res call(
      {ShortUserModel shortUserModel,
      AdditionalUserModel additionalUserModel,
      PrivateInfoUserModel? privateInfoUserModel,
      UserConnectStatusEnum connectStatusEnum});

  $ShortUserModelCopyWith<$Res> get shortUserModel;
  $AdditionalUserModelCopyWith<$Res> get additionalUserModel;
  $PrivateInfoUserModelCopyWith<$Res>? get privateInfoUserModel;
}

/// @nodoc
class _$OtherUserFullModelCopyWithImpl<$Res, $Val extends OtherUserFullModel>
    implements $OtherUserFullModelCopyWith<$Res> {
  _$OtherUserFullModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortUserModel = null,
    Object? additionalUserModel = null,
    Object? privateInfoUserModel = freezed,
    Object? connectStatusEnum = null,
  }) {
    return _then(_value.copyWith(
      shortUserModel: null == shortUserModel
          ? _value.shortUserModel
          : shortUserModel // ignore: cast_nullable_to_non_nullable
              as ShortUserModel,
      additionalUserModel: null == additionalUserModel
          ? _value.additionalUserModel
          : additionalUserModel // ignore: cast_nullable_to_non_nullable
              as AdditionalUserModel,
      privateInfoUserModel: freezed == privateInfoUserModel
          ? _value.privateInfoUserModel
          : privateInfoUserModel // ignore: cast_nullable_to_non_nullable
              as PrivateInfoUserModel?,
      connectStatusEnum: null == connectStatusEnum
          ? _value.connectStatusEnum
          : connectStatusEnum // ignore: cast_nullable_to_non_nullable
              as UserConnectStatusEnum,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShortUserModelCopyWith<$Res> get shortUserModel {
    return $ShortUserModelCopyWith<$Res>(_value.shortUserModel, (value) {
      return _then(_value.copyWith(shortUserModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AdditionalUserModelCopyWith<$Res> get additionalUserModel {
    return $AdditionalUserModelCopyWith<$Res>(_value.additionalUserModel,
        (value) {
      return _then(_value.copyWith(additionalUserModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PrivateInfoUserModelCopyWith<$Res>? get privateInfoUserModel {
    if (_value.privateInfoUserModel == null) {
      return null;
    }

    return $PrivateInfoUserModelCopyWith<$Res>(_value.privateInfoUserModel!,
        (value) {
      return _then(_value.copyWith(privateInfoUserModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OtherUserFullModelCopyWith<$Res>
    implements $OtherUserFullModelCopyWith<$Res> {
  factory _$$_OtherUserFullModelCopyWith(_$_OtherUserFullModel value,
          $Res Function(_$_OtherUserFullModel) then) =
      __$$_OtherUserFullModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ShortUserModel shortUserModel,
      AdditionalUserModel additionalUserModel,
      PrivateInfoUserModel? privateInfoUserModel,
      UserConnectStatusEnum connectStatusEnum});

  @override
  $ShortUserModelCopyWith<$Res> get shortUserModel;
  @override
  $AdditionalUserModelCopyWith<$Res> get additionalUserModel;
  @override
  $PrivateInfoUserModelCopyWith<$Res>? get privateInfoUserModel;
}

/// @nodoc
class __$$_OtherUserFullModelCopyWithImpl<$Res>
    extends _$OtherUserFullModelCopyWithImpl<$Res, _$_OtherUserFullModel>
    implements _$$_OtherUserFullModelCopyWith<$Res> {
  __$$_OtherUserFullModelCopyWithImpl(
      _$_OtherUserFullModel _value, $Res Function(_$_OtherUserFullModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortUserModel = null,
    Object? additionalUserModel = null,
    Object? privateInfoUserModel = freezed,
    Object? connectStatusEnum = null,
  }) {
    return _then(_$_OtherUserFullModel(
      shortUserModel: null == shortUserModel
          ? _value.shortUserModel
          : shortUserModel // ignore: cast_nullable_to_non_nullable
              as ShortUserModel,
      additionalUserModel: null == additionalUserModel
          ? _value.additionalUserModel
          : additionalUserModel // ignore: cast_nullable_to_non_nullable
              as AdditionalUserModel,
      privateInfoUserModel: freezed == privateInfoUserModel
          ? _value.privateInfoUserModel
          : privateInfoUserModel // ignore: cast_nullable_to_non_nullable
              as PrivateInfoUserModel?,
      connectStatusEnum: null == connectStatusEnum
          ? _value.connectStatusEnum
          : connectStatusEnum // ignore: cast_nullable_to_non_nullable
              as UserConnectStatusEnum,
    ));
  }
}

/// @nodoc

class _$_OtherUserFullModel extends _OtherUserFullModel {
  const _$_OtherUserFullModel(
      {required this.shortUserModel,
      required this.additionalUserModel,
      required this.privateInfoUserModel,
      required this.connectStatusEnum})
      : super._();

  @override
  final ShortUserModel shortUserModel;
  @override
  final AdditionalUserModel additionalUserModel;
  @override
  final PrivateInfoUserModel? privateInfoUserModel;
  @override
  final UserConnectStatusEnum connectStatusEnum;

  @override
  String toString() {
    return 'OtherUserFullModel(shortUserModel: $shortUserModel, additionalUserModel: $additionalUserModel, privateInfoUserModel: $privateInfoUserModel, connectStatusEnum: $connectStatusEnum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtherUserFullModel &&
            (identical(other.shortUserModel, shortUserModel) ||
                other.shortUserModel == shortUserModel) &&
            (identical(other.additionalUserModel, additionalUserModel) ||
                other.additionalUserModel == additionalUserModel) &&
            (identical(other.privateInfoUserModel, privateInfoUserModel) ||
                other.privateInfoUserModel == privateInfoUserModel) &&
            (identical(other.connectStatusEnum, connectStatusEnum) ||
                other.connectStatusEnum == connectStatusEnum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shortUserModel,
      additionalUserModel, privateInfoUserModel, connectStatusEnum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OtherUserFullModelCopyWith<_$_OtherUserFullModel> get copyWith =>
      __$$_OtherUserFullModelCopyWithImpl<_$_OtherUserFullModel>(
          this, _$identity);
}

abstract class _OtherUserFullModel extends OtherUserFullModel {
  const factory _OtherUserFullModel(
          {required final ShortUserModel shortUserModel,
          required final AdditionalUserModel additionalUserModel,
          required final PrivateInfoUserModel? privateInfoUserModel,
          required final UserConnectStatusEnum connectStatusEnum}) =
      _$_OtherUserFullModel;
  const _OtherUserFullModel._() : super._();

  @override
  ShortUserModel get shortUserModel;
  @override
  AdditionalUserModel get additionalUserModel;
  @override
  PrivateInfoUserModel? get privateInfoUserModel;
  @override
  UserConnectStatusEnum get connectStatusEnum;
  @override
  @JsonKey(ignore: true)
  _$$_OtherUserFullModelCopyWith<_$_OtherUserFullModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FullUserWriteModel {
  ShortUserWriteModel get shortUserWriteModel =>
      throw _privateConstructorUsedError;
  AdditionalUserWriteModel get additionalUserWriteModel =>
      throw _privateConstructorUsedError;
  PrivateInfoUserModel get privateInfoUserModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FullUserWriteModelCopyWith<FullUserWriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullUserWriteModelCopyWith<$Res> {
  factory $FullUserWriteModelCopyWith(
          FullUserWriteModel value, $Res Function(FullUserWriteModel) then) =
      _$FullUserWriteModelCopyWithImpl<$Res, FullUserWriteModel>;
  @useResult
  $Res call(
      {ShortUserWriteModel shortUserWriteModel,
      AdditionalUserWriteModel additionalUserWriteModel,
      PrivateInfoUserModel privateInfoUserModel});

  $ShortUserWriteModelCopyWith<$Res> get shortUserWriteModel;
  $AdditionalUserWriteModelCopyWith<$Res> get additionalUserWriteModel;
  $PrivateInfoUserModelCopyWith<$Res> get privateInfoUserModel;
}

/// @nodoc
class _$FullUserWriteModelCopyWithImpl<$Res, $Val extends FullUserWriteModel>
    implements $FullUserWriteModelCopyWith<$Res> {
  _$FullUserWriteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortUserWriteModel = null,
    Object? additionalUserWriteModel = null,
    Object? privateInfoUserModel = null,
  }) {
    return _then(_value.copyWith(
      shortUserWriteModel: null == shortUserWriteModel
          ? _value.shortUserWriteModel
          : shortUserWriteModel // ignore: cast_nullable_to_non_nullable
              as ShortUserWriteModel,
      additionalUserWriteModel: null == additionalUserWriteModel
          ? _value.additionalUserWriteModel
          : additionalUserWriteModel // ignore: cast_nullable_to_non_nullable
              as AdditionalUserWriteModel,
      privateInfoUserModel: null == privateInfoUserModel
          ? _value.privateInfoUserModel
          : privateInfoUserModel // ignore: cast_nullable_to_non_nullable
              as PrivateInfoUserModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShortUserWriteModelCopyWith<$Res> get shortUserWriteModel {
    return $ShortUserWriteModelCopyWith<$Res>(_value.shortUserWriteModel,
        (value) {
      return _then(_value.copyWith(shortUserWriteModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AdditionalUserWriteModelCopyWith<$Res> get additionalUserWriteModel {
    return $AdditionalUserWriteModelCopyWith<$Res>(
        _value.additionalUserWriteModel, (value) {
      return _then(_value.copyWith(additionalUserWriteModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PrivateInfoUserModelCopyWith<$Res> get privateInfoUserModel {
    return $PrivateInfoUserModelCopyWith<$Res>(_value.privateInfoUserModel,
        (value) {
      return _then(_value.copyWith(privateInfoUserModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FullUserWriteModelCopyWith<$Res>
    implements $FullUserWriteModelCopyWith<$Res> {
  factory _$$_FullUserWriteModelCopyWith(_$_FullUserWriteModel value,
          $Res Function(_$_FullUserWriteModel) then) =
      __$$_FullUserWriteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ShortUserWriteModel shortUserWriteModel,
      AdditionalUserWriteModel additionalUserWriteModel,
      PrivateInfoUserModel privateInfoUserModel});

  @override
  $ShortUserWriteModelCopyWith<$Res> get shortUserWriteModel;
  @override
  $AdditionalUserWriteModelCopyWith<$Res> get additionalUserWriteModel;
  @override
  $PrivateInfoUserModelCopyWith<$Res> get privateInfoUserModel;
}

/// @nodoc
class __$$_FullUserWriteModelCopyWithImpl<$Res>
    extends _$FullUserWriteModelCopyWithImpl<$Res, _$_FullUserWriteModel>
    implements _$$_FullUserWriteModelCopyWith<$Res> {
  __$$_FullUserWriteModelCopyWithImpl(
      _$_FullUserWriteModel _value, $Res Function(_$_FullUserWriteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortUserWriteModel = null,
    Object? additionalUserWriteModel = null,
    Object? privateInfoUserModel = null,
  }) {
    return _then(_$_FullUserWriteModel(
      shortUserWriteModel: null == shortUserWriteModel
          ? _value.shortUserWriteModel
          : shortUserWriteModel // ignore: cast_nullable_to_non_nullable
              as ShortUserWriteModel,
      additionalUserWriteModel: null == additionalUserWriteModel
          ? _value.additionalUserWriteModel
          : additionalUserWriteModel // ignore: cast_nullable_to_non_nullable
              as AdditionalUserWriteModel,
      privateInfoUserModel: null == privateInfoUserModel
          ? _value.privateInfoUserModel
          : privateInfoUserModel // ignore: cast_nullable_to_non_nullable
              as PrivateInfoUserModel,
    ));
  }
}

/// @nodoc

class _$_FullUserWriteModel extends _FullUserWriteModel {
  const _$_FullUserWriteModel(
      {required this.shortUserWriteModel,
      required this.additionalUserWriteModel,
      required this.privateInfoUserModel})
      : super._();

  @override
  final ShortUserWriteModel shortUserWriteModel;
  @override
  final AdditionalUserWriteModel additionalUserWriteModel;
  @override
  final PrivateInfoUserModel privateInfoUserModel;

  @override
  String toString() {
    return 'FullUserWriteModel(shortUserWriteModel: $shortUserWriteModel, additionalUserWriteModel: $additionalUserWriteModel, privateInfoUserModel: $privateInfoUserModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FullUserWriteModel &&
            (identical(other.shortUserWriteModel, shortUserWriteModel) ||
                other.shortUserWriteModel == shortUserWriteModel) &&
            (identical(
                    other.additionalUserWriteModel, additionalUserWriteModel) ||
                other.additionalUserWriteModel == additionalUserWriteModel) &&
            (identical(other.privateInfoUserModel, privateInfoUserModel) ||
                other.privateInfoUserModel == privateInfoUserModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shortUserWriteModel,
      additionalUserWriteModel, privateInfoUserModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FullUserWriteModelCopyWith<_$_FullUserWriteModel> get copyWith =>
      __$$_FullUserWriteModelCopyWithImpl<_$_FullUserWriteModel>(
          this, _$identity);
}

abstract class _FullUserWriteModel extends FullUserWriteModel {
  const factory _FullUserWriteModel(
          {required final ShortUserWriteModel shortUserWriteModel,
          required final AdditionalUserWriteModel additionalUserWriteModel,
          required final PrivateInfoUserModel privateInfoUserModel}) =
      _$_FullUserWriteModel;
  const _FullUserWriteModel._() : super._();

  @override
  ShortUserWriteModel get shortUserWriteModel;
  @override
  AdditionalUserWriteModel get additionalUserWriteModel;
  @override
  PrivateInfoUserModel get privateInfoUserModel;
  @override
  @JsonKey(ignore: true)
  _$$_FullUserWriteModelCopyWith<_$_FullUserWriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

PrivateInfoUserModel _$PrivateInfoUserModelFromJson(Map<String, dynamic> json) {
  return _PrivateInfoUserModel.fromJson(json);
}

/// @nodoc
mixin _$PrivateInfoUserModel {
  String? get instagramUsername => throw _privateConstructorUsedError;
  String? get telegramUsername => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivateInfoUserModelCopyWith<PrivateInfoUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivateInfoUserModelCopyWith<$Res> {
  factory $PrivateInfoUserModelCopyWith(PrivateInfoUserModel value,
          $Res Function(PrivateInfoUserModel) then) =
      _$PrivateInfoUserModelCopyWithImpl<$Res, PrivateInfoUserModel>;
  @useResult
  $Res call({String? instagramUsername, String? telegramUsername});
}

/// @nodoc
class _$PrivateInfoUserModelCopyWithImpl<$Res,
        $Val extends PrivateInfoUserModel>
    implements $PrivateInfoUserModelCopyWith<$Res> {
  _$PrivateInfoUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instagramUsername = freezed,
    Object? telegramUsername = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$_PrivateInfoUserModelCopyWith<$Res>
    implements $PrivateInfoUserModelCopyWith<$Res> {
  factory _$$_PrivateInfoUserModelCopyWith(_$_PrivateInfoUserModel value,
          $Res Function(_$_PrivateInfoUserModel) then) =
      __$$_PrivateInfoUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? instagramUsername, String? telegramUsername});
}

/// @nodoc
class __$$_PrivateInfoUserModelCopyWithImpl<$Res>
    extends _$PrivateInfoUserModelCopyWithImpl<$Res, _$_PrivateInfoUserModel>
    implements _$$_PrivateInfoUserModelCopyWith<$Res> {
  __$$_PrivateInfoUserModelCopyWithImpl(_$_PrivateInfoUserModel _value,
      $Res Function(_$_PrivateInfoUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instagramUsername = freezed,
    Object? telegramUsername = freezed,
  }) {
    return _then(_$_PrivateInfoUserModel(
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
class _$_PrivateInfoUserModel extends _PrivateInfoUserModel {
  const _$_PrivateInfoUserModel({this.instagramUsername, this.telegramUsername})
      : super._();

  factory _$_PrivateInfoUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_PrivateInfoUserModelFromJson(json);

  @override
  final String? instagramUsername;
  @override
  final String? telegramUsername;

  @override
  String toString() {
    return 'PrivateInfoUserModel(instagramUsername: $instagramUsername, telegramUsername: $telegramUsername)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrivateInfoUserModel &&
            (identical(other.instagramUsername, instagramUsername) ||
                other.instagramUsername == instagramUsername) &&
            (identical(other.telegramUsername, telegramUsername) ||
                other.telegramUsername == telegramUsername));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, instagramUsername, telegramUsername);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrivateInfoUserModelCopyWith<_$_PrivateInfoUserModel> get copyWith =>
      __$$_PrivateInfoUserModelCopyWithImpl<_$_PrivateInfoUserModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrivateInfoUserModelToJson(
      this,
    );
  }
}

abstract class _PrivateInfoUserModel extends PrivateInfoUserModel {
  const factory _PrivateInfoUserModel(
      {final String? instagramUsername,
      final String? telegramUsername}) = _$_PrivateInfoUserModel;
  const _PrivateInfoUserModel._() : super._();

  factory _PrivateInfoUserModel.fromJson(Map<String, dynamic> json) =
      _$_PrivateInfoUserModel.fromJson;

  @override
  String? get instagramUsername;
  @override
  String? get telegramUsername;
  @override
  @JsonKey(ignore: true)
  _$$_PrivateInfoUserModelCopyWith<_$_PrivateInfoUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AdditionalUserModel _$AdditionalUserModelFromJson(Map<String, dynamic> json) {
  return _AdditionalUserModel.fromJson(json);
}

/// @nodoc
mixin _$AdditionalUserModel {
// required String id,
  String? get description => throw _privateConstructorUsedError;
  String? get lookingFor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdditionalUserModelCopyWith<AdditionalUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionalUserModelCopyWith<$Res> {
  factory $AdditionalUserModelCopyWith(
          AdditionalUserModel value, $Res Function(AdditionalUserModel) then) =
      _$AdditionalUserModelCopyWithImpl<$Res, AdditionalUserModel>;
  @useResult
  $Res call({String? description, String? lookingFor});
}

/// @nodoc
class _$AdditionalUserModelCopyWithImpl<$Res, $Val extends AdditionalUserModel>
    implements $AdditionalUserModelCopyWith<$Res> {
  _$AdditionalUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? lookingFor = freezed,
  }) {
    return _then(_value.copyWith(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lookingFor: freezed == lookingFor
          ? _value.lookingFor
          : lookingFor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdditionalUserModelCopyWith<$Res>
    implements $AdditionalUserModelCopyWith<$Res> {
  factory _$$_AdditionalUserModelCopyWith(_$_AdditionalUserModel value,
          $Res Function(_$_AdditionalUserModel) then) =
      __$$_AdditionalUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? description, String? lookingFor});
}

/// @nodoc
class __$$_AdditionalUserModelCopyWithImpl<$Res>
    extends _$AdditionalUserModelCopyWithImpl<$Res, _$_AdditionalUserModel>
    implements _$$_AdditionalUserModelCopyWith<$Res> {
  __$$_AdditionalUserModelCopyWithImpl(_$_AdditionalUserModel _value,
      $Res Function(_$_AdditionalUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? lookingFor = freezed,
  }) {
    return _then(_$_AdditionalUserModel(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lookingFor: freezed == lookingFor
          ? _value.lookingFor
          : lookingFor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdditionalUserModel extends _AdditionalUserModel {
  const _$_AdditionalUserModel({this.description, this.lookingFor}) : super._();

  factory _$_AdditionalUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_AdditionalUserModelFromJson(json);

// required String id,
  @override
  final String? description;
  @override
  final String? lookingFor;

  @override
  String toString() {
    return 'AdditionalUserModel(description: $description, lookingFor: $lookingFor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdditionalUserModel &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lookingFor, lookingFor) ||
                other.lookingFor == lookingFor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description, lookingFor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdditionalUserModelCopyWith<_$_AdditionalUserModel> get copyWith =>
      __$$_AdditionalUserModelCopyWithImpl<_$_AdditionalUserModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdditionalUserModelToJson(
      this,
    );
  }
}

abstract class _AdditionalUserModel extends AdditionalUserModel {
  const factory _AdditionalUserModel(
      {final String? description,
      final String? lookingFor}) = _$_AdditionalUserModel;
  const _AdditionalUserModel._() : super._();

  factory _AdditionalUserModel.fromJson(Map<String, dynamic> json) =
      _$_AdditionalUserModel.fromJson;

  @override // required String id,
  String? get description;
  @override
  String? get lookingFor;
  @override
  @JsonKey(ignore: true)
  _$$_AdditionalUserModelCopyWith<_$_AdditionalUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ShortUserModel _$ShortUserModelFromJson(Map<String, dynamic> json) {
  return _ShortUserModel.fromJson(json);
}

/// @nodoc
mixin _$ShortUserModel {
  String get id => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;
  DateTime get birthDate => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> get commonTags => throw _privateConstructorUsedError;
  int get soulsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShortUserModelCopyWith<ShortUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortUserModelCopyWith<$Res> {
  factory $ShortUserModelCopyWith(
          ShortUserModel value, $Res Function(ShortUserModel) then) =
      _$ShortUserModelCopyWithImpl<$Res, ShortUserModel>;
  @useResult
  $Res call(
      {String id,
      String nickname,
      List<String> photos,
      DateTime birthDate,
      List<String> tags,
      @JsonKey(includeFromJson: false, includeToJson: false)
          List<String> commonTags,
      int soulsCount});
}

/// @nodoc
class _$ShortUserModelCopyWithImpl<$Res, $Val extends ShortUserModel>
    implements $ShortUserModelCopyWith<$Res> {
  _$ShortUserModelCopyWithImpl(this._value, this._then);

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
    Object? birthDate = null,
    Object? tags = null,
    Object? commonTags = null,
    Object? soulsCount = null,
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
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commonTags: null == commonTags
          ? _value.commonTags
          : commonTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      soulsCount: null == soulsCount
          ? _value.soulsCount
          : soulsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShortUserModelCopyWith<$Res>
    implements $ShortUserModelCopyWith<$Res> {
  factory _$$_ShortUserModelCopyWith(
          _$_ShortUserModel value, $Res Function(_$_ShortUserModel) then) =
      __$$_ShortUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nickname,
      List<String> photos,
      DateTime birthDate,
      List<String> tags,
      @JsonKey(includeFromJson: false, includeToJson: false)
          List<String> commonTags,
      int soulsCount});
}

/// @nodoc
class __$$_ShortUserModelCopyWithImpl<$Res>
    extends _$ShortUserModelCopyWithImpl<$Res, _$_ShortUserModel>
    implements _$$_ShortUserModelCopyWith<$Res> {
  __$$_ShortUserModelCopyWithImpl(
      _$_ShortUserModel _value, $Res Function(_$_ShortUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? photos = null,
    Object? birthDate = null,
    Object? tags = null,
    Object? commonTags = null,
    Object? soulsCount = null,
  }) {
    return _then(_$_ShortUserModel(
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
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commonTags: null == commonTags
          ? _value._commonTags
          : commonTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      soulsCount: null == soulsCount
          ? _value.soulsCount
          : soulsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShortUserModel extends _ShortUserModel {
  const _$_ShortUserModel(
      {required this.id,
      required this.nickname,
      required final List<String> photos,
      required this.birthDate,
      required final List<String> tags,
      @JsonKey(includeFromJson: false, includeToJson: false)
          final List<String> commonTags = const <String>[],
      required this.soulsCount})
      : _photos = photos,
        _tags = tags,
        _commonTags = commonTags,
        super._();

  factory _$_ShortUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_ShortUserModelFromJson(json);

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
  final DateTime birthDate;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _commonTags;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> get commonTags {
    if (_commonTags is EqualUnmodifiableListView) return _commonTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commonTags);
  }

  @override
  final int soulsCount;

  @override
  String toString() {
    return 'ShortUserModel(id: $id, nickname: $nickname, photos: $photos, birthDate: $birthDate, tags: $tags, commonTags: $commonTags, soulsCount: $soulsCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShortUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._commonTags, _commonTags) &&
            (identical(other.soulsCount, soulsCount) ||
                other.soulsCount == soulsCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nickname,
      const DeepCollectionEquality().hash(_photos),
      birthDate,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_commonTags),
      soulsCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShortUserModelCopyWith<_$_ShortUserModel> get copyWith =>
      __$$_ShortUserModelCopyWithImpl<_$_ShortUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShortUserModelToJson(
      this,
    );
  }
}

abstract class _ShortUserModel extends ShortUserModel {
  const factory _ShortUserModel(
      {required final String id,
      required final String nickname,
      required final List<String> photos,
      required final DateTime birthDate,
      required final List<String> tags,
      @JsonKey(includeFromJson: false, includeToJson: false)
          final List<String> commonTags,
      required final int soulsCount}) = _$_ShortUserModel;
  const _ShortUserModel._() : super._();

  factory _ShortUserModel.fromJson(Map<String, dynamic> json) =
      _$_ShortUserModel.fromJson;

  @override
  String get id;
  @override
  String get nickname;
  @override
  List<String> get photos;
  @override
  DateTime get birthDate;
  @override
  List<String> get tags;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> get commonTags;
  @override
  int get soulsCount;
  @override
  @JsonKey(ignore: true)
  _$$_ShortUserModelCopyWith<_$_ShortUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ShortUserWriteModel _$ShortUserWriteModelFromJson(Map<String, dynamic> json) {
  return _ShortUserWriteModel.fromJson(json);
}

/// @nodoc
mixin _$ShortUserWriteModel {
  String get nickname => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;
  DateTime get birthDate => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int? get soulsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShortUserWriteModelCopyWith<ShortUserWriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortUserWriteModelCopyWith<$Res> {
  factory $ShortUserWriteModelCopyWith(
          ShortUserWriteModel value, $Res Function(ShortUserWriteModel) then) =
      _$ShortUserWriteModelCopyWithImpl<$Res, ShortUserWriteModel>;
  @useResult
  $Res call(
      {String nickname,
      List<String> photos,
      DateTime birthDate,
      List<String> tags,
      @JsonKey(includeIfNull: false) int? soulsCount});
}

/// @nodoc
class _$ShortUserWriteModelCopyWithImpl<$Res, $Val extends ShortUserWriteModel>
    implements $ShortUserWriteModelCopyWith<$Res> {
  _$ShortUserWriteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? photos = null,
    Object? birthDate = null,
    Object? tags = null,
    Object? soulsCount = freezed,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      soulsCount: freezed == soulsCount
          ? _value.soulsCount
          : soulsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShortUserWriteModelCopyWith<$Res>
    implements $ShortUserWriteModelCopyWith<$Res> {
  factory _$$_ShortUserWriteModelCopyWith(_$_ShortUserWriteModel value,
          $Res Function(_$_ShortUserWriteModel) then) =
      __$$_ShortUserWriteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nickname,
      List<String> photos,
      DateTime birthDate,
      List<String> tags,
      @JsonKey(includeIfNull: false) int? soulsCount});
}

/// @nodoc
class __$$_ShortUserWriteModelCopyWithImpl<$Res>
    extends _$ShortUserWriteModelCopyWithImpl<$Res, _$_ShortUserWriteModel>
    implements _$$_ShortUserWriteModelCopyWith<$Res> {
  __$$_ShortUserWriteModelCopyWithImpl(_$_ShortUserWriteModel _value,
      $Res Function(_$_ShortUserWriteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? photos = null,
    Object? birthDate = null,
    Object? tags = null,
    Object? soulsCount = freezed,
  }) {
    return _then(_$_ShortUserWriteModel(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      soulsCount: freezed == soulsCount
          ? _value.soulsCount
          : soulsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShortUserWriteModel extends _ShortUserWriteModel {
  const _$_ShortUserWriteModel(
      {required this.nickname,
      required final List<String> photos,
      required this.birthDate,
      required final List<String> tags,
      @JsonKey(includeIfNull: false) this.soulsCount})
      : _photos = photos,
        _tags = tags,
        super._();

  factory _$_ShortUserWriteModel.fromJson(Map<String, dynamic> json) =>
      _$$_ShortUserWriteModelFromJson(json);

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
  final DateTime birthDate;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey(includeIfNull: false)
  final int? soulsCount;

  @override
  String toString() {
    return 'ShortUserWriteModel(nickname: $nickname, photos: $photos, birthDate: $birthDate, tags: $tags, soulsCount: $soulsCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShortUserWriteModel &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.soulsCount, soulsCount) ||
                other.soulsCount == soulsCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nickname,
      const DeepCollectionEquality().hash(_photos),
      birthDate,
      const DeepCollectionEquality().hash(_tags),
      soulsCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShortUserWriteModelCopyWith<_$_ShortUserWriteModel> get copyWith =>
      __$$_ShortUserWriteModelCopyWithImpl<_$_ShortUserWriteModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShortUserWriteModelToJson(
      this,
    );
  }
}

abstract class _ShortUserWriteModel extends ShortUserWriteModel {
  const factory _ShortUserWriteModel(
          {required final String nickname,
          required final List<String> photos,
          required final DateTime birthDate,
          required final List<String> tags,
          @JsonKey(includeIfNull: false) final int? soulsCount}) =
      _$_ShortUserWriteModel;
  const _ShortUserWriteModel._() : super._();

  factory _ShortUserWriteModel.fromJson(Map<String, dynamic> json) =
      _$_ShortUserWriteModel.fromJson;

  @override
  String get nickname;
  @override
  List<String> get photos;
  @override
  DateTime get birthDate;
  @override
  List<String> get tags;
  @override
  @JsonKey(includeIfNull: false)
  int? get soulsCount;
  @override
  @JsonKey(ignore: true)
  _$$_ShortUserWriteModelCopyWith<_$_ShortUserWriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AdditionalUserWriteModel _$AdditionalUserWriteModelFromJson(
    Map<String, dynamic> json) {
  return _AdditionalUserWriteModel.fromJson(json);
}

/// @nodoc
mixin _$AdditionalUserWriteModel {
  String? get description => throw _privateConstructorUsedError;
  String? get lookingFor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdditionalUserWriteModelCopyWith<AdditionalUserWriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionalUserWriteModelCopyWith<$Res> {
  factory $AdditionalUserWriteModelCopyWith(AdditionalUserWriteModel value,
          $Res Function(AdditionalUserWriteModel) then) =
      _$AdditionalUserWriteModelCopyWithImpl<$Res, AdditionalUserWriteModel>;
  @useResult
  $Res call({String? description, String? lookingFor});
}

/// @nodoc
class _$AdditionalUserWriteModelCopyWithImpl<$Res,
        $Val extends AdditionalUserWriteModel>
    implements $AdditionalUserWriteModelCopyWith<$Res> {
  _$AdditionalUserWriteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? lookingFor = freezed,
  }) {
    return _then(_value.copyWith(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lookingFor: freezed == lookingFor
          ? _value.lookingFor
          : lookingFor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdditionalUserWriteModelCopyWith<$Res>
    implements $AdditionalUserWriteModelCopyWith<$Res> {
  factory _$$_AdditionalUserWriteModelCopyWith(
          _$_AdditionalUserWriteModel value,
          $Res Function(_$_AdditionalUserWriteModel) then) =
      __$$_AdditionalUserWriteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? description, String? lookingFor});
}

/// @nodoc
class __$$_AdditionalUserWriteModelCopyWithImpl<$Res>
    extends _$AdditionalUserWriteModelCopyWithImpl<$Res,
        _$_AdditionalUserWriteModel>
    implements _$$_AdditionalUserWriteModelCopyWith<$Res> {
  __$$_AdditionalUserWriteModelCopyWithImpl(_$_AdditionalUserWriteModel _value,
      $Res Function(_$_AdditionalUserWriteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? lookingFor = freezed,
  }) {
    return _then(_$_AdditionalUserWriteModel(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lookingFor: freezed == lookingFor
          ? _value.lookingFor
          : lookingFor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdditionalUserWriteModel extends _AdditionalUserWriteModel {
  const _$_AdditionalUserWriteModel({this.description, this.lookingFor})
      : super._();

  factory _$_AdditionalUserWriteModel.fromJson(Map<String, dynamic> json) =>
      _$$_AdditionalUserWriteModelFromJson(json);

  @override
  final String? description;
  @override
  final String? lookingFor;

  @override
  String toString() {
    return 'AdditionalUserWriteModel(description: $description, lookingFor: $lookingFor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdditionalUserWriteModel &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lookingFor, lookingFor) ||
                other.lookingFor == lookingFor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description, lookingFor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdditionalUserWriteModelCopyWith<_$_AdditionalUserWriteModel>
      get copyWith => __$$_AdditionalUserWriteModelCopyWithImpl<
          _$_AdditionalUserWriteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdditionalUserWriteModelToJson(
      this,
    );
  }
}

abstract class _AdditionalUserWriteModel extends AdditionalUserWriteModel {
  const factory _AdditionalUserWriteModel(
      {final String? description,
      final String? lookingFor}) = _$_AdditionalUserWriteModel;
  const _AdditionalUserWriteModel._() : super._();

  factory _AdditionalUserWriteModel.fromJson(Map<String, dynamic> json) =
      _$_AdditionalUserWriteModel.fromJson;

  @override
  String? get description;
  @override
  String? get lookingFor;
  @override
  @JsonKey(ignore: true)
  _$$_AdditionalUserWriteModelCopyWith<_$_AdditionalUserWriteModel>
      get copyWith => throw _privateConstructorUsedError;
}
