import 'package:flutter_mobile_starter/common/data/models/user_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';

part 'event_models.freezed.dart';
part 'event_models.g.dart';

@freezed
class UserPairEventModel with _$UserPairEventModel {
  const UserPairEventModel._();

  const factory UserPairEventModel({
    required String ownerUserId,
    required VeryShortUserModel otherUser,
    required bool isNotSeen,
    required DateTime dateTime,
    required UserEventTypeEnum eventType,
  }) = _UserEventModel;

  factory UserPairEventModel.fromJson(Map<String, dynamic> json) => _$UserPairEventModelFromJson(json);
}

@freezed
class AppOpenedEventModel with _$AppOpenedEventModel {
  const AppOpenedEventModel._();

  const factory AppOpenedEventModel({
    required String userId,
    required DateTime dateTime,
  }) = _AppOpenedEventModel;

  factory AppOpenedEventModel.fromJson(Map<String, dynamic> json) => _$AppOpenedEventModelFromJson(json);
}