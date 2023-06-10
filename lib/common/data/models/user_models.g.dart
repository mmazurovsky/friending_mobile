// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

Map<String, dynamic> _$$_ShortCreateUserModelToJson(
        _$_ShortCreateUserModel instance) =>
    <String, dynamic>{
      'soulsCount': instance.soulsCount,
      'id': instance.id,
      'username': instance.username,
      'photos': instance.photos,
      'birthDate': instance.birthDate.toIso8601String(),
      'createdDateTime': instance.createdDateTime.toIso8601String(),
      'tags': instance.tags,
    };

_$_ShortUpdateUserModel _$$_ShortUpdateUserModelFromJson(
        Map<String, dynamic> json) =>
    _$_ShortUpdateUserModel(
      username: json['username'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      birthDate: DateTime.parse(json['birthDate'] as String),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ShortUpdateUserModelToJson(
        _$_ShortUpdateUserModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'photos': instance.photos,
      'birthDate': instance.birthDate.toIso8601String(),
      'tags': instance.tags,
    };

_$_ShortReadUserModel _$$_ShortReadUserModelFromJson(
        Map<String, dynamic> json) =>
    _$_ShortReadUserModel(
      id: json['id'] as String,
      username: json['username'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      birthDate: DateTime.parse(json['birthDate'] as String),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      commonTags: (json['commonTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

_$_VeryShortUserModel _$$_VeryShortUserModelFromJson(
        Map<String, dynamic> json) =>
    _$_VeryShortUserModel(
      id: json['id'] as String,
      username: json['username'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$$_VeryShortUserModelToJson(
        _$_VeryShortUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'photo': instance.photo,
    };
