import 'package:flutter/material.dart';

abstract class UserConnectStatus {
  String get buttonTitle;
  Color get buttonColor;
  Color get titleColor;
  VoidCallback get onTap;
}

class UserConnectStatusConnected implements UserConnectStatus {
  const UserConnectStatusConnected();
  @override
  String get buttonTitle => 'Unpair';
  @override
  Color get buttonColor => const Color(0xFFE0E0E0);
  @override
  Color get titleColor => const Color(0xFFE0E0E0);
  @override
  VoidCallback get onTap => () {};
}

class UserConnectStatusDisconnected implements UserConnectStatus {
  const UserConnectStatusDisconnected();
  @override
  String get buttonTitle => 'Pair';
  @override
  Color get buttonColor => const Color(0xFFE0E0E0);
  @override
  Color get titleColor => const Color(0xFFE0E0E0);
  @override
  VoidCallback get onTap => () {};
}

class UserConnectStatusRequested implements UserConnectStatus {
  const UserConnectStatusRequested();
  @override
  String get buttonTitle => 'Requested to pair';
  @override
  Color get buttonColor => const Color(0xFFE0E0E0);
  @override
  Color get titleColor => const Color(0xFFE0E0E0);
  @override
  VoidCallback get onTap => () {};
}

class UserConnectStatusToBeApproved implements UserConnectStatus {
  const UserConnectStatusToBeApproved();
  @override
  String get buttonTitle => 'Pair';
  @override
  Color get buttonColor => const Color(0xFFE0E0E0);
  @override
  Color get titleColor => const Color(0xFFE0E0E0);
  @override
  VoidCallback get onTap => () {};
}
