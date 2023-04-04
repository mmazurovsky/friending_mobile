// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FullUserWriteModel _$$_FullUserWriteModelFromJson(
        Map<String, dynamic> json) =>
    _$_FullUserWriteModel(
      shortUserWriteModel: ShortUserWriteModel.fromJson(
          json['shortUserWriteModel'] as Map<String, dynamic>),
      additionalUserWriteModel: AdditionalUserWriteModel.fromJson(
          json['additionalUserWriteModel'] as Map<String, dynamic>),
      privateInfoUserModel: PrivateInfoUserModel.fromJson(
          json['privateInfoUserModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FullUserWriteModelToJson(
        _$_FullUserWriteModel instance) =>
    <String, dynamic>{
      'shortUserWriteModel': instance.shortUserWriteModel.toJson(),
      'additionalUserWriteModel': instance.additionalUserWriteModel.toJson(),
      'privateInfoUserModel': instance.privateInfoUserModel.toJson(),
    };

_$_PrivateInfoUserModel _$$_PrivateInfoUserModelFromJson(
        Map<String, dynamic> json) =>
    _$_PrivateInfoUserModel(
      instagramUsername: json['instagramUsername'] as String?,
      telegramUsername: json['telegramUsername'] as String?,
    );

Map<String, dynamic> _$$_PrivateInfoUserModelToJson(
        _$_PrivateInfoUserModel instance) =>
    <String, dynamic>{
      'instagramUsername': instance.instagramUsername,
      'telegramUsername': instance.telegramUsername,
    };

_$_AdditionalUserModel _$$_AdditionalUserModelFromJson(
        Map<String, dynamic> json) =>
    _$_AdditionalUserModel(
      description: json['description'] as String?,
      lookingFor: json['lookingFor'] as String?,
    );

Map<String, dynamic> _$$_AdditionalUserModelToJson(
        _$_AdditionalUserModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'lookingFor': instance.lookingFor,
    };

_$_ShortUserModel _$$_ShortUserModelFromJson(Map<String, dynamic> json) =>
    _$_ShortUserModel(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      birthDate: DateTime.parse(json['birthDate'] as String),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      soulsCount: json['soulsCount'] as int,
    );

Map<String, dynamic> _$$_ShortUserModelToJson(_$_ShortUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'photos': instance.photos,
      'birthDate': instance.birthDate.toIso8601String(),
      'tags': instance.tags,
      'soulsCount': instance.soulsCount,
    };

_$_VeryShortUserModel _$$_VeryShortUserModelFromJson(
        Map<String, dynamic> json) =>
    _$_VeryShortUserModel(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$$_VeryShortUserModelToJson(
        _$_VeryShortUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'photo': instance.photo,
    };

_$_ShortUserWriteModel _$$_ShortUserWriteModelFromJson(
        Map<String, dynamic> json) =>
    _$_ShortUserWriteModel(
      nickname: json['nickname'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      birthDate: DateTime.parse(json['birthDate'] as String),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      soulsCount: json['soulsCount'] as int?,
    );

Map<String, dynamic> _$$_ShortUserWriteModelToJson(
    _$_ShortUserWriteModel instance) {
  final val = <String, dynamic>{
    'nickname': instance.nickname,
    'photos': instance.photos,
    'birthDate': instance.birthDate.toIso8601String(),
    'tags': instance.tags,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('soulsCount', instance.soulsCount);
  return val;
}

_$_AdditionalUserWriteModel _$$_AdditionalUserWriteModelFromJson(
        Map<String, dynamic> json) =>
    _$_AdditionalUserWriteModel(
      description: json['description'] as String?,
      lookingFor: json['lookingFor'] as String?,
    );

Map<String, dynamic> _$$_AdditionalUserWriteModelToJson(
        _$_AdditionalUserWriteModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'lookingFor': instance.lookingFor,
    };
