import 'entities/user_connect_status.dart';
import 'entities/user_goal.dart';

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

enum UserGoalsEnum {
  findFriends,
  dating,
  hookup,
  other;

  UserGoal get content {
    switch (this) {
      case UserGoalsEnum.findFriends:
        return const UserGoalFindFriends();
      case UserGoalsEnum.dating:
        return const UserGoalDating();
      case UserGoalsEnum.hookup:
        return const UserGoalHookup();
      case UserGoalsEnum.other:
        return const UserGoalOther();
    }
  }
}
