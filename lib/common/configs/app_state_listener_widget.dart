import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppStateListenerWidget extends HookWidget {
  final Widget child;
  const AppStateListenerWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final appLifecycleState = useAppLifecycleState();
    useEffect(() {
      print("current app state");
      print(appLifecycleState);
      return null;
    }, [appLifecycleState]);
    return child;
  }
}
