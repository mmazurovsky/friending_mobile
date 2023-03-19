import 'package:flutter/material.dart';

import '../models/user_models.dart';

abstract class UserEvent {
  VeryShortUserModel get otherUser;
  String get text;
  void Function(BuildContext) get onTap;
  bool get isNew;
}

class ConnectRequestAwaitsApprovalUserEvent implements UserEvent {
  @override
  final VeryShortUserModel otherUser;

  @override
  final bool isNew;

  const ConnectRequestAwaitsApprovalUserEvent({
    required this.otherUser,
    required this.isNew,
  });

  @override
  String get text => '${otherUser.nickname} wants to connect with you';

  @override
  void Function(BuildContext) get onTap {
    return (BuildContext context) {
      Navigator.of(context).pop();
    };
  }
}

class ConnectRequestWasApprovedUserEvent implements UserEvent {
  @override
  final VeryShortUserModel otherUser;

  @override
  final bool isNew;

  const ConnectRequestWasApprovedUserEvent({
    required this.otherUser,
    required this.isNew,
  });

  @override
  String get text => '${otherUser.nickname} has connected with you';

  @override
  void Function(BuildContext) get onTap {
    return (BuildContext context) {
      Navigator.of(context).pop();
    };
  }
}
