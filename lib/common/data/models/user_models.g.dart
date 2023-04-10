// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FullUserModel _$$_FullUserModelFromJson(Map<String, dynamic> json) =>
    _$_FullUserModel(
      shortUserModel: ShortUserModel.fromJson(
          json['shortUserModel'] as Map<String, dynamic>),
      additionalUserModel: AdditionalUserModel.fromJson(
          json['additionalUserModel'] as Map<String, dynamic>),
      privateInfoUserModel: PrivateInfoUserModel.fromJson(
          json['privateInfoUserModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FullUserModelToJson(_$_FullUserModel instance) =>
    <String, dynamic>{
      'shortUserModel': instance.shortUserModel.toJson(),
      'additionalUserModel': instance.additionalUserModel.toJson(),
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
      soulsCount: json['soulsCount'] as int,
      commonTags: (json['commonTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$$_ShortUserModelToJson(_$_ShortUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'photos': instance.photos,
      'birthDate': instance.birthDate.toIso8601String(),
      'soulsCount': instance.soulsCount,
      'commonTags': instance.commonTags,
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
