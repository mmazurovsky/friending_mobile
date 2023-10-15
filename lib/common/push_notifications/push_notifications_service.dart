import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../dependency_injection/dependency_injection.dart';

class PushNotificaitonsConfigWidget extends StatefulWidget {
  final Widget child;
  const PushNotificaitonsConfigWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<PushNotificaitonsConfigWidget> createState() => _PushNotificaitonsConfigWidgetState();
}

class _PushNotificaitonsConfigWidgetState extends State<PushNotificaitonsConfigWidget> {
  late final FirebaseMessaging _firebaseMessaging;
  @override
  void initState() {
    super.initState();

    _firebaseMessaging = getIt<FirebaseMessaging>();

    _firebaseMessaging.requestPermission();
    // message when app is in foreground
    FirebaseMessaging.onMessage.listen((event) {
      print('Message received while app in foregr');
    });

    // message when app is opened from the background state
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedAppHandler);

    // message when app is opened from the terminated state
    _checkAppIsOpenedFromTerminalState();

    // on message when app is in background or terminated (and probably when it is not even get opened)
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  }

  static Future<void> _onBackgroundMessage(RemoteMessage message) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        print('FirebaseMessaging::onBackgroundMessage callback: message $message');
      },
    );
  }

  void _checkAppIsOpenedFromTerminalState() async {
    final initialMessageAfterLaunchAfterTerminatedState = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessageAfterLaunchAfterTerminatedState != null) {
      _onMessageOpenedAppHandler(initialMessageAfterLaunchAfterTerminatedState);
    }
  }

  void _onMessageOpenedAppHandler(RemoteMessage message) async {
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
