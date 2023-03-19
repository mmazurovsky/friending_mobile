import 'package:flutter_mobile_starter/common/data/models/user_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';

part 'event_models.freezed.dart';
part 'event_models.g.dart';

@freezed
class UserEventModel with _$UserEventModel {
  const UserEventModel._();

  const factory UserEventModel({
    required String ownerUserId,
    required VeryShortUserModel otherUser,
    required bool isNew,
    required DateTime dateTime,
    required UserEventTypeEnum eventType,
  }) = _UserEventModel;

  factory UserEventModel.fromJson(Map<String, dynamic> json) =>
      _$UserEventModelFromJson(json);
}
