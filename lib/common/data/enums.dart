import 'entities/user_connect_status.dart';
import 'entities/user_event.dart';
import 'models/user_models.dart';

enum UserConnectStatusEnum {
  connected,
  disconnected,
  requested,
  toBeApproved;

  @override
  String toString() => this.name;

  UserConnectStatus get content {
    switch (this) {
      case UserConnectStatusEnum.connected:
        return const UserConnectStatusConnected();
      case UserConnectStatusEnum.disconnected:
        return const UserConnectStatusDisconnected();
      case UserConnectStatusEnum.requested:
        return const UserConnectStatusRequested();
      case UserConnectStatusEnum.toBeApproved:
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
