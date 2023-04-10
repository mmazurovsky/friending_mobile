import 'package:flutter/material.dart';

import 'app_state_listener_widget.dart';
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
      child: AppStateListenerWidget(
        child: PlatformBrightnessListenerWidget(child: child),
      ),
    );
  }
}
