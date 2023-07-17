import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import '../../../common/dependency_injection/dependency_injection.dart';
import '../../../common/navigation/auto_router/app_router.dart';
import '../../widgets/custom_edge_insets.dart';
import '../state/profile_page_routing_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<ProfilePageRoutingManager>(),
      child: const RoutingWidget(),
    );

    // StreamBuilder(
    //   //TODO rewrite this part to use router
    //   stream: getIt<ProfileRepo>().getProfileStream(),
    //   builder: ((context, AsyncSnapshot<ShortReadUserModel?> snapshot) {
    //     if (snapshot.hasData) {
    //       if (snapshot.data!.username == 'empty') {
    //         return const ProfileEditingPage();
    //       } else {
    //         return ThisUserProfilePage(shortProfile: snapshot.data!);
    //       }
    //     } else {
    //       return SafeArea(
    //         child: Center(
    //           child: const SignInPageButton(),
    //         ),
    //       );
    //     }
    //   }),
    // );
  }
}

class RoutingWidget extends StatelessWidget {
  const RoutingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<ProfilePageRoutingManager>().pageToShow;
  }
}
