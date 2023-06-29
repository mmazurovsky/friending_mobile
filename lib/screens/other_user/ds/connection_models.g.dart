// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConnectionModel _$$_ConnectionModelFromJson(Map<String, dynamic> json) =>
    _$_ConnectionModel(
      userId: json['userId'] as String,
      status: $enumDecode(_$UserConnectStatusEnumEnumMap, json['status']),
      createdDateTime: DateTime.parse(json['createdDateTime'] as String),
      endedDateTime: json['endedDateTime'] == null
          ? null
          : DateTime.parse(json['endedDateTime'] as String),
    );

Map<String, dynamic> _$$_ConnectionModelToJson(_$_ConnectionModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'status': _$UserConnectStatusEnumEnumMap[instance.status]!,
      'createdDateTime': instance.createdDateTime.toIso8601String(),
      'endedDateTime': instance.endedDateTime?.toIso8601String(),
    };

const _$UserConnectStatusEnumEnumMap = {
  UserConnectStatusEnum.connected: 'connected',
  UserConnectStatusEnum.disconnected: 'disconnected',
  UserConnectStatusEnum.requested: 'requested',
  UserConnectStatusEnum.toBeApproved: 'toBeApproved',
};
