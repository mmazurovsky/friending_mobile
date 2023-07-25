import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../screens/explore/repo/coordinates_repo.dart';
import '../../screens/explore/state/geo_permissions_manager.dart';
import '../dependency_injection/dependency_injection.dart';

class AppLifecycleStateListenerWidget extends HookWidget {
  final Widget child;
  const AppLifecycleStateListenerWidget({
    super.key,
    required this.child,
  });

  Future<void> addUserPosition() async {
    getIt<CoordinatesRepo>().addCurrentPositionToRemoteAndLocal();
  }

  @override
  Widget build(BuildContext context) {
    final appLifecycleState = useAppLifecycleState();
    useEffect(() {
      if (appLifecycleState == AppLifecycleState.resumed) {
        context.read<GeoPermissionsManager>().checkLocationPermissionAndStore();
        addUserPosition();
      }
      return null;
    }, [appLifecycleState]);
    return child;
  }
}
