import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bag/stateful/spaces.dart';
import '../bag/stateful/theme.dart';
import 'connection_listener.dart';
import 'location_permission.dart';

class AppStateListenerWidget extends StatefulWidget {
  final Widget child;
  const AppStateListenerWidget({
    super.key,
    required this.child,
  });

  @override
  State<AppStateListenerWidget> createState() => _AppStateListenerWidgetState();
}

class _AppStateListenerWidgetState extends State<AppStateListenerWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ConnectionListener.connectionListener(context);
        LocationPermissionChecker.locationPermissionChecker();
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    _changeBrightnessInChangeNotifier();
    super.didChangePlatformBrightness();
  }

  void _changeBrightnessInChangeNotifier() {
    final newBrightness =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .platformBrightness;
    Provider.of<ThemeStateManager>(context, listen: false).changeBrightness(
      newBrightness,
    );
  }

  void _changeScreenWidthInChangeNotifier() {
    final screenWidth = MediaQuery.of(context).size.width;
    context.read<SpacesStateManager>().initOrChangeWidth(screenWidth);
  }

  @override
  void didChangeMetrics() {
    _changeScreenWidthInChangeNotifier();
    super.didChangeMetrics();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
