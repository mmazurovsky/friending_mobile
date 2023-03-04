import 'dart:ui';

abstract class UserGoal {
  String get name;
  Color get color;
  int get order;

  //pilot create equals and hashcode
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserGoal &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          color == other.color &&
          order == other.order;

  @override
  int get hashCode => name.hashCode ^ color.hashCode ^ order.hashCode;
}

class UserGoalFindFriends implements UserGoal {
  const UserGoalFindFriends();
  @override
  String get name => 'Find Friends';
  @override
  Color get color => const Color(0xFFE0E0E0);
  @override
  int get order => 0;
}

class UserGoalDating implements UserGoal {
  const UserGoalDating();
  @override
  String get name => 'Dating';
  @override
  Color get color => const Color(0xFFE0E0E0);
  @override
  int get order => 1;
}

class UserGoalHookup implements UserGoal {
  const UserGoalHookup();
  @override
  String get name => 'Hookup';
  @override
  Color get color => const Color(0xFFE0E0E0);
  @override
  int get order => 2;
}

class UserGoalOther implements UserGoal {
  const UserGoalOther();
  @override
  String get name => 'Other';
  @override
  Color get color => const Color(0xFFE0E0E0);
  @override
  int get order => 3;
}
