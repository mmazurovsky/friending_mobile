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
mixin _$FullReadUserModel {
  ShortReadUserModel get shortUserModel =>
      throw _privateConstructorUsedError; // required AdditionalUserModel additionalUserModel,
  PrivateInfoUserModel get privateInfoUserModel =>
      throw _privateConstructorUsedError;
  ShortReadUserModel? get pairedWith => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FullReadUserModelCopyWith<FullReadUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullReadUserModelCopyWith<$Res> {
  factory $FullReadUserModelCopyWith(
          FullReadUserModel value, $Res Function(FullReadUserModel) then) =
      _$FullReadUserModelCopyWithImpl<$Res, FullReadUserModel>;
  @useResult
  $Res call(
      {ShortReadUserModel shortUserModel,
      PrivateInfoUserModel privateInfoUserModel,
      ShortReadUserModel? pairedWith});

  $ShortReadUserModelCopyWith<$Res> get shortUserModel;
  $PrivateInfoUserModelCopyWith<$Res> get privateInfoUserModel;
  $ShortReadUserModelCopyWith<$Res>? get pairedWith;
}

/// @nodoc
class _$FullReadUserModelCopyWithImpl<$Res, $Val extends FullReadUserModel>
    implements $FullReadUserModelCopyWith<$Res> {
  _$FullReadUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortUserModel = null,
    Object? privateInfoUserModel = null,
    Object? pairedWith = freezed,
  }) {
    return _then(_value.copyWith(
      shortUserModel: null == shortUserModel
          ? _value.shortUserModel
          : shortUserModel // ignore: cast_nullable_to_non_nullable
              as ShortReadUserModel,
      privateInfoUserModel: null == privateInfoUserModel
          ? _value.privateInfoUserModel
          : privateInfoUserModel // ignore: cast_nullable_to_non_nullable
              as PrivateInfoUserModel,
      pairedWith: freezed == pairedWith
          ? _value.pairedWith
          : pairedWith // ignore: cast_nullable_to_non_nullable
              as ShortReadUserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShortReadUserModelCopyWith<$Res> get shortUserModel {
    return $ShortReadUserModelCopyWith<$Res>(_value.shortUserModel, (value) {
      return _then(_value.copyWith(shortUserModel: value) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $ShortReadUserModelCopyWith<$Res>? get pairedWith {
    if (_value.pairedWith == null) {
      return null;
    }

    return $ShortReadUserModelCopyWith<$Res>(_value.pairedWith!, (value) {
      return _then(_value.copyWith(pairedWith: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FullReadUserModelCopyWith<$Res>
    implements $FullReadUserModelCopyWith<$Res> {
  factory _$$_FullReadUserModelCopyWith(_$_FullReadUserModel value,
          $Res Function(_$_FullReadUserModel) then) =
      __$$_FullReadUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ShortReadUserModel shortUserModel,
      PrivateInfoUserModel privateInfoUserModel,
      ShortReadUserModel? pairedWith});

  @override
  $ShortReadUserModelCopyWith<$Res> get shortUserModel;
  @override
  $PrivateInfoUserModelCopyWith<$Res> get privateInfoUserModel;
  @override
  $ShortReadUserModelCopyWith<$Res>? get pairedWith;
}

/// @nodoc
class __$$_FullReadUserModelCopyWithImpl<$Res>
    extends _$FullReadUserModelCopyWithImpl<$Res, _$_FullReadUserModel>
    implements _$$_FullReadUserModelCopyWith<$Res> {
  __$$_FullReadUserModelCopyWithImpl(
      _$_FullReadUserModel _value, $Res Function(_$_FullReadUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortUserModel = null,
    Object? privateInfoUserModel = null,
    Object? pairedWith = freezed,
  }) {
    return _then(_$_FullReadUserModel(
      shortUserModel: null == shortUserModel
          ? _value.shortUserModel
          : shortUserModel // ignore: cast_nullable_to_non_nullable
              as ShortReadUserModel,
      privateInfoUserModel: null == privateInfoUserModel
          ? _value.privateInfoUserModel
          : privateInfoUserModel // ignore: cast_nullable_to_non_nullable
              as PrivateInfoUserModel,
      pairedWith: freezed == pairedWith
          ? _value.pairedWith
          : pairedWith // ignore: cast_nullable_to_non_nullable
              as ShortReadUserModel?,
    ));
  }
}

/// @nodoc

class _$_FullReadUserModel extends _FullReadUserModel {
  const _$_FullReadUserModel(
      {required this.shortUserModel,
      required this.privateInfoUserModel,
      required this.pairedWith})
      : super._();

  @override
  final ShortReadUserModel shortUserModel;
// required AdditionalUserModel additionalUserModel,
  @override
  final PrivateInfoUserModel privateInfoUserModel;
  @override
  final ShortReadUserModel? pairedWith;

  @override
  String toString() {
    return 'FullReadUserModel(shortUserModel: $shortUserModel, privateInfoUserModel: $privateInfoUserModel, pairedWith: $pairedWith)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FullReadUserModel &&
            (identical(other.shortUserModel, shortUserModel) ||
                other.shortUserModel == shortUserModel) &&
            (identical(other.privateInfoUserModel, privateInfoUserModel) ||
                other.privateInfoUserModel == privateInfoUserModel) &&
            (identical(other.pairedWith, pairedWith) ||
                other.pairedWith == pairedWith));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, shortUserModel, privateInfoUserModel, pairedWith);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FullReadUserModelCopyWith<_$_FullReadUserModel> get copyWith =>
      __$$_FullReadUserModelCopyWithImpl<_$_FullReadUserModel>(
          this, _$identity);
}

abstract class _FullReadUserModel extends FullReadUserModel {
  const factory _FullReadUserModel(
      {required final ShortReadUserModel shortUserModel,
      required final PrivateInfoUserModel privateInfoUserModel,
      required final ShortReadUserModel? pairedWith}) = _$_FullReadUserModel;
  const _FullReadUserModel._() : super._();

  @override
  ShortReadUserModel get shortUserModel;
  @override // required AdditionalUserModel additionalUserModel,
  PrivateInfoUserModel get privateInfoUserModel;
  @override
  ShortReadUserModel? get pairedWith;
  @override
  @JsonKey(ignore: true)
  _$$_FullReadUserModelCopyWith<_$_FullReadUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OtherUserFullModel {
  ShortReadUserModel get shortUserModel =>
      throw _privateConstructorUsedError; // required AdditionalUserModel additionalUserModel,
  PrivateInfoUserModel? get privateInfoUserModel =>
      throw _privateConstructorUsedError;
  UserConnectStatusEnum get connectStatusEnum =>
      throw _privateConstructorUsedError;
  ShortReadUserModel? get pairedWith => throw _privateConstructorUsedError;

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
      {ShortReadUserModel shortUserModel,
      PrivateInfoUserModel? privateInfoUserModel,
      UserConnectStatusEnum connectStatusEnum,
      ShortReadUserModel? pairedWith});

  $ShortReadUserModelCopyWith<$Res> get shortUserModel;
  $PrivateInfoUserModelCopyWith<$Res>? get privateInfoUserModel;
  $ShortReadUserModelCopyWith<$Res>? get pairedWith;
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
    Object? privateInfoUserModel = freezed,
    Object? connectStatusEnum = null,
    Object? pairedWith = freezed,
  }) {
    return _then(_value.copyWith(
      shortUserModel: null == shortUserModel
          ? _value.shortUserModel
          : shortUserModel // ignore: cast_nullable_to_non_nullable
              as ShortReadUserModel,
      privateInfoUserModel: freezed == privateInfoUserModel
          ? _value.privateInfoUserModel
          : privateInfoUserModel // ignore: cast_nullable_to_non_nullable
              as PrivateInfoUserModel?,
      connectStatusEnum: null == connectStatusEnum
          ? _value.connectStatusEnum
          : connectStatusEnum // ignore: cast_nullable_to_non_nullable
              as UserConnectStatusEnum,
      pairedWith: freezed == pairedWith
          ? _value.pairedWith
          : pairedWith // ignore: cast_nullable_to_non_nullable
              as ShortReadUserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShortReadUserModelCopyWith<$Res> get shortUserModel {
    return $ShortReadUserModelCopyWith<$Res>(_value.shortUserModel, (value) {
      return _then(_value.copyWith(shortUserModel: value) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $ShortReadUserModelCopyWith<$Res>? get pairedWith {
    if (_value.pairedWith == null) {
      return null;
    }

    return $ShortReadUserModelCopyWith<$Res>(_value.pairedWith!, (value) {
      return _then(_value.copyWith(pairedWith: value) as $Val);
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
      {ShortReadUserModel shortUserModel,
      PrivateInfoUserModel? privateInfoUserModel,
      UserConnectStatusEnum connectStatusEnum,
      ShortReadUserModel? pairedWith});

  @override
  $ShortReadUserModelCopyWith<$Res> get shortUserModel;
  @override
  $PrivateInfoUserModelCopyWith<$Res>? get privateInfoUserModel;
  @override
  $ShortReadUserModelCopyWith<$Res>? get pairedWith;
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
    Object? privateInfoUserModel = freezed,
    Object? connectStatusEnum = null,
    Object? pairedWith = freezed,
  }) {
    return _then(_$_OtherUserFullModel(
      shortUserModel: null == shortUserModel
          ? _value.shortUserModel
          : shortUserModel // ignore: cast_nullable_to_non_nullable
              as ShortReadUserModel,
      privateInfoUserModel: freezed == privateInfoUserModel
          ? _value.privateInfoUserModel
          : privateInfoUserModel // ignore: cast_nullable_to_non_nullable
              as PrivateInfoUserModel?,
      connectStatusEnum: null == connectStatusEnum
          ? _value.connectStatusEnum
          : connectStatusEnum // ignore: cast_nullable_to_non_nullable
              as UserConnectStatusEnum,
      pairedWith: freezed == pairedWith
          ? _value.pairedWith
          : pairedWith // ignore: cast_nullable_to_non_nullable
              as ShortReadUserModel?,
    ));
  }
}

/// @nodoc

class _$_OtherUserFullModel extends _OtherUserFullModel {
  const _$_OtherUserFullModel(
      {required this.shortUserModel,
      required this.privateInfoUserModel,
      required this.connectStatusEnum,
      required this.pairedWith})
      : super._();

  @override
  final ShortReadUserModel shortUserModel;
// required AdditionalUserModel additionalUserModel,
  @override
  final PrivateInfoUserModel? privateInfoUserModel;
  @override
  final UserConnectStatusEnum connectStatusEnum;
  @override
  final ShortReadUserModel? pairedWith;

  @override
  String toString() {
    return 'OtherUserFullModel(shortUserModel: $shortUserModel, privateInfoUserModel: $privateInfoUserModel, connectStatusEnum: $connectStatusEnum, pairedWith: $pairedWith)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtherUserFullModel &&
            (identical(other.shortUserModel, shortUserModel) ||
                other.shortUserModel == shortUserModel) &&
            (identical(other.privateInfoUserModel, privateInfoUserModel) ||
                other.privateInfoUserModel == privateInfoUserModel) &&
            (identical(other.connectStatusEnum, connectStatusEnum) ||
                other.connectStatusEnum == connectStatusEnum) &&
            (identical(other.pairedWith, pairedWith) ||
                other.pairedWith == pairedWith));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shortUserModel,
      privateInfoUserModel, connectStatusEnum, pairedWith);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OtherUserFullModelCopyWith<_$_OtherUserFullModel> get copyWith =>
      __$$_OtherUserFullModelCopyWithImpl<_$_OtherUserFullModel>(
          this, _$identity);
}

abstract class _OtherUserFullModel extends OtherUserFullModel {
  const factory _OtherUserFullModel(
      {required final ShortReadUserModel shortUserModel,
      required final PrivateInfoUserModel? privateInfoUserModel,
      required final UserConnectStatusEnum connectStatusEnum,
      required final ShortReadUserModel? pairedWith}) = _$_OtherUserFullModel;
  const _OtherUserFullModel._() : super._();

  @override
  ShortReadUserModel get shortUserModel;
  @override // required AdditionalUserModel additionalUserModel,
  PrivateInfoUserModel? get privateInfoUserModel;
  @override
  UserConnectStatusEnum get connectStatusEnum;
  @override
  ShortReadUserModel? get pairedWith;
  @override
  @JsonKey(ignore: true)
  _$$_OtherUserFullModelCopyWith<_$_OtherUserFullModel> get copyWith =>
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

/// @nodoc
mixin _$ShortCreateUserModel {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;
  DateTime get birthDate => throw _privateConstructorUsedError;
  DateTime get createdDateTime => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  String get lookingFor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShortCreateUserModelCopyWith<ShortCreateUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortCreateUserModelCopyWith<$Res> {
  factory $ShortCreateUserModelCopyWith(ShortCreateUserModel value,
          $Res Function(ShortCreateUserModel) then) =
      _$ShortCreateUserModelCopyWithImpl<$Res, ShortCreateUserModel>;
  @useResult
  $Res call(
      {String id,
      String username,
      List<String> photos,
      DateTime birthDate,
      DateTime createdDateTime,
      List<String> tags,
      String about,
      String lookingFor});
}

/// @nodoc
class _$ShortCreateUserModelCopyWithImpl<$Res,
        $Val extends ShortCreateUserModel>
    implements $ShortCreateUserModelCopyWith<$Res> {
  _$ShortCreateUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? photos = null,
    Object? birthDate = null,
    Object? createdDateTime = null,
    Object? tags = null,
    Object? about = null,
    Object? lookingFor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdDateTime: null == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      lookingFor: null == lookingFor
          ? _value.lookingFor
          : lookingFor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShortCreateUserModelCopyWith<$Res>
    implements $ShortCreateUserModelCopyWith<$Res> {
  factory _$$_ShortCreateUserModelCopyWith(_$_ShortCreateUserModel value,
          $Res Function(_$_ShortCreateUserModel) then) =
      __$$_ShortCreateUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      List<String> photos,
      DateTime birthDate,
      DateTime createdDateTime,
      List<String> tags,
      String about,
      String lookingFor});
}

/// @nodoc
class __$$_ShortCreateUserModelCopyWithImpl<$Res>
    extends _$ShortCreateUserModelCopyWithImpl<$Res, _$_ShortCreateUserModel>
    implements _$$_ShortCreateUserModelCopyWith<$Res> {
  __$$_ShortCreateUserModelCopyWithImpl(_$_ShortCreateUserModel _value,
      $Res Function(_$_ShortCreateUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? photos = null,
    Object? birthDate = null,
    Object? createdDateTime = null,
    Object? tags = null,
    Object? about = null,
    Object? lookingFor = null,
  }) {
    return _then(_$_ShortCreateUserModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdDateTime: null == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      lookingFor: null == lookingFor
          ? _value.lookingFor
          : lookingFor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$_ShortCreateUserModel extends _ShortCreateUserModel {
  const _$_ShortCreateUserModel(
      {required this.id,
      required this.username,
      required final List<String> photos,
      required this.birthDate,
      required this.createdDateTime,
      required final List<String> tags,
      required this.about,
      required this.lookingFor})
      : _photos = photos,
        _tags = tags,
        super._();

  @override
  final String id;
  @override
  final String username;
  final List<String> _photos;
  @override
  List<String> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  final DateTime birthDate;
  @override
  final DateTime createdDateTime;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String about;
  @override
  final String lookingFor;

  @override
  String toString() {
    return 'ShortCreateUserModel(id: $id, username: $username, photos: $photos, birthDate: $birthDate, createdDateTime: $createdDateTime, tags: $tags, about: $about, lookingFor: $lookingFor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShortCreateUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.createdDateTime, createdDateTime) ||
                other.createdDateTime == createdDateTime) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.lookingFor, lookingFor) ||
                other.lookingFor == lookingFor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      const DeepCollectionEquality().hash(_photos),
      birthDate,
      createdDateTime,
      const DeepCollectionEquality().hash(_tags),
      about,
      lookingFor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShortCreateUserModelCopyWith<_$_ShortCreateUserModel> get copyWith =>
      __$$_ShortCreateUserModelCopyWithImpl<_$_ShortCreateUserModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShortCreateUserModelToJson(
      this,
    );
  }
}

abstract class _ShortCreateUserModel extends ShortCreateUserModel {
  const factory _ShortCreateUserModel(
      {required final String id,
      required final String username,
      required final List<String> photos,
      required final DateTime birthDate,
      required final DateTime createdDateTime,
      required final List<String> tags,
      required final String about,
      required final String lookingFor}) = _$_ShortCreateUserModel;
  const _ShortCreateUserModel._() : super._();

  @override
  String get id;
  @override
  String get username;
  @override
  List<String> get photos;
  @override
  DateTime get birthDate;
  @override
  DateTime get createdDateTime;
  @override
  List<String> get tags;
  @override
  String get about;
  @override
  String get lookingFor;
  @override
  @JsonKey(ignore: true)
  _$$_ShortCreateUserModelCopyWith<_$_ShortCreateUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ShortUpdateUserModel _$ShortUpdateUserModelFromJson(Map<String, dynamic> json) {
  return _ShortUpdateUserModel.fromJson(json);
}

/// @nodoc
mixin _$ShortUpdateUserModel {
  String get username => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;
  DateTime get birthDate => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  String get lookingFor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShortUpdateUserModelCopyWith<ShortUpdateUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortUpdateUserModelCopyWith<$Res> {
  factory $ShortUpdateUserModelCopyWith(ShortUpdateUserModel value,
          $Res Function(ShortUpdateUserModel) then) =
      _$ShortUpdateUserModelCopyWithImpl<$Res, ShortUpdateUserModel>;
  @useResult
  $Res call(
      {String username,
      List<String> photos,
      DateTime birthDate,
      List<String> tags,
      String about,
      String lookingFor});
}

/// @nodoc
class _$ShortUpdateUserModelCopyWithImpl<$Res,
        $Val extends ShortUpdateUserModel>
    implements $ShortUpdateUserModelCopyWith<$Res> {
  _$ShortUpdateUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? photos = null,
    Object? birthDate = null,
    Object? tags = null,
    Object? about = null,
    Object? lookingFor = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
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
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      lookingFor: null == lookingFor
          ? _value.lookingFor
          : lookingFor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShortUpdateUserModelCopyWith<$Res>
    implements $ShortUpdateUserModelCopyWith<$Res> {
  factory _$$_ShortUpdateUserModelCopyWith(_$_ShortUpdateUserModel value,
          $Res Function(_$_ShortUpdateUserModel) then) =
      __$$_ShortUpdateUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      List<String> photos,
      DateTime birthDate,
      List<String> tags,
      String about,
      String lookingFor});
}

/// @nodoc
class __$$_ShortUpdateUserModelCopyWithImpl<$Res>
    extends _$ShortUpdateUserModelCopyWithImpl<$Res, _$_ShortUpdateUserModel>
    implements _$$_ShortUpdateUserModelCopyWith<$Res> {
  __$$_ShortUpdateUserModelCopyWithImpl(_$_ShortUpdateUserModel _value,
      $Res Function(_$_ShortUpdateUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? photos = null,
    Object? birthDate = null,
    Object? tags = null,
    Object? about = null,
    Object? lookingFor = null,
  }) {
    return _then(_$_ShortUpdateUserModel(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
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
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      lookingFor: null == lookingFor
          ? _value.lookingFor
          : lookingFor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShortUpdateUserModel extends _ShortUpdateUserModel {
  const _$_ShortUpdateUserModel(
      {required this.username,
      required final List<String> photos,
      required this.birthDate,
      required final List<String> tags,
      required this.about,
      required this.lookingFor})
      : _photos = photos,
        _tags = tags,
        super._();

  factory _$_ShortUpdateUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_ShortUpdateUserModelFromJson(json);

  @override
  final String username;
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
  final String about;
  @override
  final String lookingFor;

  @override
  String toString() {
    return 'ShortUpdateUserModel(username: $username, photos: $photos, birthDate: $birthDate, tags: $tags, about: $about, lookingFor: $lookingFor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShortUpdateUserModel &&
            (identical(other.username, username) ||
                other.username == username) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.lookingFor, lookingFor) ||
                other.lookingFor == lookingFor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      username,
      const DeepCollectionEquality().hash(_photos),
      birthDate,
      const DeepCollectionEquality().hash(_tags),
      about,
      lookingFor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShortUpdateUserModelCopyWith<_$_ShortUpdateUserModel> get copyWith =>
      __$$_ShortUpdateUserModelCopyWithImpl<_$_ShortUpdateUserModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShortUpdateUserModelToJson(
      this,
    );
  }
}

abstract class _ShortUpdateUserModel extends ShortUpdateUserModel {
  const factory _ShortUpdateUserModel(
      {required final String username,
      required final List<String> photos,
      required final DateTime birthDate,
      required final List<String> tags,
      required final String about,
      required final String lookingFor}) = _$_ShortUpdateUserModel;
  const _ShortUpdateUserModel._() : super._();

  factory _ShortUpdateUserModel.fromJson(Map<String, dynamic> json) =
      _$_ShortUpdateUserModel.fromJson;

  @override
  String get username;
  @override
  List<String> get photos;
  @override
  DateTime get birthDate;
  @override
  List<String> get tags;
  @override
  String get about;
  @override
  String get lookingFor;
  @override
  @JsonKey(ignore: true)
  _$$_ShortUpdateUserModelCopyWith<_$_ShortUpdateUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ShortReadUserModel _$ShortReadUserModelFromJson(Map<String, dynamic> json) {
  return _ShortReadUserModel.fromJson(json);
}

/// @nodoc
mixin _$ShortReadUserModel {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;
  DateTime get birthDate => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  String get lookingFor =>
      throw _privateConstructorUsedError; //*INFO: this gets filled later
  List<String> get commonTags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShortReadUserModelCopyWith<ShortReadUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortReadUserModelCopyWith<$Res> {
  factory $ShortReadUserModelCopyWith(
          ShortReadUserModel value, $Res Function(ShortReadUserModel) then) =
      _$ShortReadUserModelCopyWithImpl<$Res, ShortReadUserModel>;
  @useResult
  $Res call(
      {String id,
      String username,
      List<String> photos,
      DateTime birthDate,
      List<String> tags,
      String about,
      String lookingFor,
      List<String> commonTags});
}

/// @nodoc
class _$ShortReadUserModelCopyWithImpl<$Res, $Val extends ShortReadUserModel>
    implements $ShortReadUserModelCopyWith<$Res> {
  _$ShortReadUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? photos = null,
    Object? birthDate = null,
    Object? tags = null,
    Object? about = null,
    Object? lookingFor = null,
    Object? commonTags = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
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
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      lookingFor: null == lookingFor
          ? _value.lookingFor
          : lookingFor // ignore: cast_nullable_to_non_nullable
              as String,
      commonTags: null == commonTags
          ? _value.commonTags
          : commonTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShortReadUserModelCopyWith<$Res>
    implements $ShortReadUserModelCopyWith<$Res> {
  factory _$$_ShortReadUserModelCopyWith(_$_ShortReadUserModel value,
          $Res Function(_$_ShortReadUserModel) then) =
      __$$_ShortReadUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      List<String> photos,
      DateTime birthDate,
      List<String> tags,
      String about,
      String lookingFor,
      List<String> commonTags});
}

/// @nodoc
class __$$_ShortReadUserModelCopyWithImpl<$Res>
    extends _$ShortReadUserModelCopyWithImpl<$Res, _$_ShortReadUserModel>
    implements _$$_ShortReadUserModelCopyWith<$Res> {
  __$$_ShortReadUserModelCopyWithImpl(
      _$_ShortReadUserModel _value, $Res Function(_$_ShortReadUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? photos = null,
    Object? birthDate = null,
    Object? tags = null,
    Object? about = null,
    Object? lookingFor = null,
    Object? commonTags = null,
  }) {
    return _then(_$_ShortReadUserModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
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
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      lookingFor: null == lookingFor
          ? _value.lookingFor
          : lookingFor // ignore: cast_nullable_to_non_nullable
              as String,
      commonTags: null == commonTags
          ? _value._commonTags
          : commonTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_ShortReadUserModel extends _ShortReadUserModel {
  const _$_ShortReadUserModel(
      {required this.id,
      required this.username,
      required final List<String> photos,
      required this.birthDate,
      required final List<String> tags,
      required this.about,
      required this.lookingFor,
      final List<String> commonTags = const []})
      : _photos = photos,
        _tags = tags,
        _commonTags = commonTags,
        super._();

  factory _$_ShortReadUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_ShortReadUserModelFromJson(json);

  @override
  final String id;
  @override
  final String username;
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
  final String about;
  @override
  final String lookingFor;
//*INFO: this gets filled later
  final List<String> _commonTags;
//*INFO: this gets filled later
  @override
  @JsonKey()
  List<String> get commonTags {
    if (_commonTags is EqualUnmodifiableListView) return _commonTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commonTags);
  }

  @override
  String toString() {
    return 'ShortReadUserModel(id: $id, username: $username, photos: $photos, birthDate: $birthDate, tags: $tags, about: $about, lookingFor: $lookingFor, commonTags: $commonTags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShortReadUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.lookingFor, lookingFor) ||
                other.lookingFor == lookingFor) &&
            const DeepCollectionEquality()
                .equals(other._commonTags, _commonTags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      const DeepCollectionEquality().hash(_photos),
      birthDate,
      const DeepCollectionEquality().hash(_tags),
      about,
      lookingFor,
      const DeepCollectionEquality().hash(_commonTags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShortReadUserModelCopyWith<_$_ShortReadUserModel> get copyWith =>
      __$$_ShortReadUserModelCopyWithImpl<_$_ShortReadUserModel>(
          this, _$identity);
}

abstract class _ShortReadUserModel extends ShortReadUserModel {
  const factory _ShortReadUserModel(
      {required final String id,
      required final String username,
      required final List<String> photos,
      required final DateTime birthDate,
      required final List<String> tags,
      required final String about,
      required final String lookingFor,
      final List<String> commonTags}) = _$_ShortReadUserModel;
  const _ShortReadUserModel._() : super._();

  factory _ShortReadUserModel.fromJson(Map<String, dynamic> json) =
      _$_ShortReadUserModel.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  List<String> get photos;
  @override
  DateTime get birthDate;
  @override
  List<String> get tags;
  @override
  String get about;
  @override
  String get lookingFor;
  @override //*INFO: this gets filled later
  List<String> get commonTags;
  @override
  @JsonKey(ignore: true)
  _$$_ShortReadUserModelCopyWith<_$_ShortReadUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

VeryShortUserModel _$VeryShortUserModelFromJson(Map<String, dynamic> json) {
  return _VeryShortUserModel.fromJson(json);
}

/// @nodoc
mixin _$VeryShortUserModel {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VeryShortUserModelCopyWith<VeryShortUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VeryShortUserModelCopyWith<$Res> {
  factory $VeryShortUserModelCopyWith(
          VeryShortUserModel value, $Res Function(VeryShortUserModel) then) =
      _$VeryShortUserModelCopyWithImpl<$Res, VeryShortUserModel>;
  @useResult
  $Res call({String id, String username, String photo});
}

/// @nodoc
class _$VeryShortUserModelCopyWithImpl<$Res, $Val extends VeryShortUserModel>
    implements $VeryShortUserModelCopyWith<$Res> {
  _$VeryShortUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? photo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VeryShortUserModelCopyWith<$Res>
    implements $VeryShortUserModelCopyWith<$Res> {
  factory _$$_VeryShortUserModelCopyWith(_$_VeryShortUserModel value,
          $Res Function(_$_VeryShortUserModel) then) =
      __$$_VeryShortUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String username, String photo});
}

/// @nodoc
class __$$_VeryShortUserModelCopyWithImpl<$Res>
    extends _$VeryShortUserModelCopyWithImpl<$Res, _$_VeryShortUserModel>
    implements _$$_VeryShortUserModelCopyWith<$Res> {
  __$$_VeryShortUserModelCopyWithImpl(
      _$_VeryShortUserModel _value, $Res Function(_$_VeryShortUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? photo = null,
  }) {
    return _then(_$_VeryShortUserModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VeryShortUserModel extends _VeryShortUserModel {
  const _$_VeryShortUserModel(
      {required this.id, required this.username, required this.photo})
      : super._();

  factory _$_VeryShortUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_VeryShortUserModelFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String photo;

  @override
  String toString() {
    return 'VeryShortUserModel(id: $id, username: $username, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VeryShortUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VeryShortUserModelCopyWith<_$_VeryShortUserModel> get copyWith =>
      __$$_VeryShortUserModelCopyWithImpl<_$_VeryShortUserModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VeryShortUserModelToJson(
      this,
    );
  }
}

abstract class _VeryShortUserModel extends VeryShortUserModel {
  const factory _VeryShortUserModel(
      {required final String id,
      required final String username,
      required final String photo}) = _$_VeryShortUserModel;
  const _VeryShortUserModel._() : super._();

  factory _VeryShortUserModel.fromJson(Map<String, dynamic> json) =
      _$_VeryShortUserModel.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String get photo;
  @override
  @JsonKey(ignore: true)
  _$$_VeryShortUserModelCopyWith<_$_VeryShortUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
