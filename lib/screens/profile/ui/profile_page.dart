import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../common/dependency_injection/dependency_injection.dart';
import '../../../common/navigation/auto_router/app_router.dart';
import '../repo/profile_repo.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    getIt<ProfileRepo>().getProfileStream().listen((event) {
      if (event != null) {
        context.router.replace(
          ThisUserProfileRoute(shortProfile: event),
        );
      } else {
        context.router.replace(
          const ProfileEditingRoute(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
