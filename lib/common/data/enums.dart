import 'entities/user_connect_status.dart';

enum UserConnectStatusEnum {
  connected,
  disconnected,
  requested,
  toBeApproved;

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
