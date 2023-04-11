import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../../screens/widgets/snack_bar.dart';
import '../bag/stateful/spaces.dart';
import '../bag/stateful/theme.dart';

class ConnectionListenerWidget extends StatefulWidget {
  final Widget child;
  const ConnectionListenerWidget({super.key, required this.child});

  @override
  State<ConnectionListenerWidget> createState() =>
      _ConnectionListenerWidgetState();
}

class _ConnectionListenerWidgetState extends State<ConnectionListenerWidget> {
  @override
  void initState() {
    super.initState();
    listen();
  }

  void listen() {
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
                    context.spacesRead.unit1,
                  ),
                ),
                backgroundColor: context.theme.snackBarTheme.backgroundColor,
                content: const CustomSnackBarContent(
                  'No internet connection',
                ),
                duration: const Duration(milliseconds: 1400),
              ),
            );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
