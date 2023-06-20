import 'package:flutter/material.dart';

import '../refresh/refresh_config.dart';
import 'app_state_listener_widget.dart';
import 'connection_listener_widget.dart';
import 'initializations_widget.dart';
import 'platform_brightness_listener_widget.dart';

class GlobalConfigWidget extends StatelessWidget {
  final Widget child;
  const GlobalConfigWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InitializationsWidget(
      child: ConnectionListenerWidget(
        child: AppStateListenerWidget(
          child: PlatformBrightnessListenerWidget(
            child: MyRefreshConfiguration(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
