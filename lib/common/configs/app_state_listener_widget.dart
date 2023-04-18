import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../screens/explore/repo/coordinates_repo.dart';
import '../dependency_injection/dependency_injection.dart';

class AppStateListenerWidget extends HookWidget {
  final Widget child;
  const AppStateListenerWidget({
    super.key,
    required this.child,
  });

  Future<void> addUserPosition() async {
    final result = await getIt<CoordinatesRepo>().addCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final appLifecycleState = useAppLifecycleState();
    useEffect(() {
      if (appLifecycleState == AppLifecycleState.resumed) {
        addUserPosition();
      }
      print('current app lifecycle state: $appLifecycleState');
      return null;
    }, [appLifecycleState]);
    return child;
  }
}
