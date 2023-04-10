import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';

import '../../screens/explore/repo/coordinates_repo.dart';
import '../dependency_injection/dependency_injection.dart';

class AppStateListenerWidget extends HookWidget {
  final Widget child;
  const AppStateListenerWidget({
    super.key,
    required this.child,
  });

  void addUserLocation() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      final result = await getIt<CoordinatesRepo>().addCurrentPosition();
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLifecycleState = useAppLifecycleState();
    useEffect(() {
      if (appLifecycleState == AppLifecycleState.resumed) {
        addUserLocation();
      }
      print("current app state");
      print(appLifecycleState);
      return null;
    }, [appLifecycleState]);
    return child;
  }
}
