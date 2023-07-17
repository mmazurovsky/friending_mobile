import 'package:flutter/material.dart';

import '../dependency_injection/dependency_injection.dart';
import 'auth_changes_listener.dart';
import 'location_permission.dart';

class InitializationsWidget extends StatefulWidget {
  final Widget child;
  const InitializationsWidget({
    super.key,
    required this.child,
  });

  @override
  State<InitializationsWidget> createState() => _InitializationsWidgetState();
}

class _InitializationsWidgetState extends State<InitializationsWidget> {
  @override
  void initState() {
    // getIt<AuthChangesListenerImpl>()();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
