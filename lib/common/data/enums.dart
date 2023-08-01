import 'entities/user_connect_status.dart';
import 'entities/user_event.dart';
import 'models/user_models.dart';

enum UserPairStatusEnum {
  paired,
  unpaired,
  requested,
  toBeApproved;

  @override
  String toString() => this.name;
}

enum UserEventTypeEnum {
  connectRequestAwaitsApproval,
  connectRequestWasApproved;

  UserEvent getContent(
    VeryShortUserModel otherUser,
    bool isNew,
  ) {
    switch (this) {
      case UserEventTypeEnum.connectRequestAwaitsApproval:
        return ConnectRequestAwaitsApprovalUserEvent(
          otherUser: otherUser,
          isNew: isNew,
        );
      case UserEventTypeEnum.connectRequestWasApproved:
        return ConnectRequestWasApprovedUserEvent(
          otherUser: otherUser,
          isNew: isNew,
        );
    }
  }
}
