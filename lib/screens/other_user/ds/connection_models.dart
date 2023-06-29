import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/data/enums.dart';

part 'connection_models.freezed.dart';
part 'connection_models.g.dart';

@freezed
class ConnectionModel with _$ConnectionModel {
  const ConnectionModel._();

  const factory ConnectionModel({
    required String userId,
    required UserPairStatusEnum status,
    required DateTime createdDateTime,
    DateTime? endedDateTime,
  }) = _ConnectionModel;

  factory ConnectionModel.fromJson(Map<String, dynamic> json) =>
      _$ConnectionModelFromJson(json);
}
