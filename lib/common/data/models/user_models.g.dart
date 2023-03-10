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
      id: json['id'] as String,
      description: json['description'] as String?,
      lookingFor: json['lookingFor'] as String?,
    );

Map<String, dynamic> _$$_AdditionalUserModelToJson(
        _$_AdditionalUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
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
      commonInterests: (json['commonInterests'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ShortUserModelToJson(_$_ShortUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'photos': instance.photos,
      'birthDate': instance.birthDate.toIso8601String(),
      'commonInterests': instance.commonInterests,
    };
