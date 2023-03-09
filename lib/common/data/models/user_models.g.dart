// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FullUserModel _$$_FullUserModelFromJson(Map<String, dynamic> json) =>
    _$_FullUserModel(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      connectStatus:
          $enumDecode(_$UserConnectStatusEnumEnumMap, json['connectStatus']),
      interests:
          (json['interests'] as List<dynamic>).map((e) => e as String).toList(),
      birthDate: DateTime.parse(json['birthDate'] as String),
      description: json['description'] as String?,
      lookingFor: json['lookingFor'] as String?,
      instagramUsername: json['instagramUsername'] as String?,
      telegramUsername: json['telegramUsername'] as String?,
    );

Map<String, dynamic> _$$_FullUserModelToJson(_$_FullUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'photos': instance.photos,
      'connectStatus': _$UserConnectStatusEnumEnumMap[instance.connectStatus]!,
      'interests': instance.interests,
      'birthDate': instance.birthDate.toIso8601String(),
      'description': instance.description,
      'lookingFor': instance.lookingFor,
      'instagramUsername': instance.instagramUsername,
      'telegramUsername': instance.telegramUsername,
    };

const _$UserConnectStatusEnumEnumMap = {
  UserConnectStatusEnum.connected: 'connected',
  UserConnectStatusEnum.disconnected: 'disconnected',
  UserConnectStatusEnum.requested: 'requested',
  UserConnectStatusEnum.toBeApproved: 'toBeApproved',
};
