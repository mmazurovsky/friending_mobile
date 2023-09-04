import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../bag/stateful/theme.dart';

class PlatformBrightnessListenerWidget extends HookWidget {
  final Widget child;
  const PlatformBrightnessListenerWidget({super.key, required this.child});

  @override
  Widget build(
    BuildContext context,
  ) {
    final brightness = usePlatformBrightness();
    final appLifecycleState = useAppLifecycleState();
    useEffect(
      () {
        if (appLifecycleState == AppLifecycleState.resumed && brightness != context.read<ColorsStateManager>().currentBrightness) {
          context.read<ColorsStateManager>().changeBrightness(brightness);
        }

        return null;
      },
    );

    return child;
  }
}
