// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConnectionModel _$$_ConnectionModelFromJson(Map<String, dynamic> json) =>
    _$_ConnectionModel(
      userId: json['userId'] as String,
      status: $enumDecode(_$UserPairStatusEnumEnumMap, json['status']),
      createdDateTime: DateTime.parse(json['createdDateTime'] as String),
      endedDateTime: json['endedDateTime'] == null
          ? null
          : DateTime.parse(json['endedDateTime'] as String),
    );

Map<String, dynamic> _$$_ConnectionModelToJson(_$_ConnectionModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'status': _$UserPairStatusEnumEnumMap[instance.status]!,
      'createdDateTime': instance.createdDateTime.toIso8601String(),
      'endedDateTime': instance.endedDateTime?.toIso8601String(),
    };

const _$UserPairStatusEnumEnumMap = {
  UserPairStatusEnum.paired: 'paired',
  UserPairStatusEnum.unpaired: 'unpaired',
  UserPairStatusEnum.requested: 'requested',
  UserPairStatusEnum.toBeApproved: 'toBeApproved',
};
