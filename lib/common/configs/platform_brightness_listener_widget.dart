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
    useEffect(
      () {
        Provider.of<ThemeStateManager>(context, listen: false).changeBrightness(
          brightness,
        );
        return null;
      },
    );

    return child;
  }
}
