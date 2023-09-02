import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../widgets/snack_bar.dart';
import '../dependency_injection/dependency_injection.dart';

class ConnectionListenerWidget extends StatefulWidget {
  final Widget child;
  const ConnectionListenerWidget({super.key, required this.child});

  @override
  State<ConnectionListenerWidget> createState() => _ConnectionListenerWidgetState();
}

class _ConnectionListenerWidgetState extends State<ConnectionListenerWidget> {
  @override
  void initState() {
    super.initState();
    listen();
  }

  void listen() {
    final scaffoldMessengerKey = getIt<GlobalKey<ScaffoldMessengerState>>();
    Provider.of<Connectivity>(context, listen: false).onConnectivityChanged.listen(
      (event) async {
        final hasConnection = await context.read<InternetConnectionChecker>().hasConnection;

        if (!hasConnection && context.mounted) {
          scaffoldMessengerKey.currentState
            ?..hideCurrentSnackBar()
            ..showCSnackBar(
              const CustomSnackBarContent(
                'No internet connection',
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
