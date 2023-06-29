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

  UserConnectStatus get content {
    switch (this) {
      case UserPairStatusEnum.paired:
        return const UserConnectStatusConnected();
      case UserPairStatusEnum.unpaired:
        return const UserConnectStatusDisconnected();
      case UserPairStatusEnum.requested:
        return const UserConnectStatusRequested();
      case UserPairStatusEnum.toBeApproved:
        return const UserConnectStatusToBeApproved();
    }
  }
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
