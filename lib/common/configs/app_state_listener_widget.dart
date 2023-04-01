import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../../screens/widgets/snack_bar.dart';
import '../bag/stateful/spaces.dart';
import '../bag/stateful/theme.dart';

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
        final scaffoldMessengerKey =
            context.read<GlobalKey<ScaffoldMessengerState>>();
        Provider.of<Connectivity>(context, listen: false)
            .onConnectivityChanged
            .listen(
          (event) async {
            final hasConnection =
                await context.read<InternetConnectionChecker>().hasConnection;

            if (!hasConnection && context.mounted) {
              scaffoldMessengerKey.currentState
                ?..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        context.spacesRead.radius1,
                      ),
                    ),
                    backgroundColor:
                        context.theme.snackBarTheme.backgroundColor,
                    content: const CustomSnackBarContent(
                      'No internet connection',
                    ),
                    duration: const Duration(milliseconds: 1400),
                  ),
                );
            }
          },
        );
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

  @override
  void didChangeMetrics() {
    final screenWidth = MediaQuery.of(context).size.width;
    context.read<SpacesStateManager>().initOrChangeWidth(screenWidth);
    super.didChangeMetrics();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
