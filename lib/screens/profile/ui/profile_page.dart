import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../common/data/models/user_models.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../../../common/navigation/auto_router/app_router.dart';
import '../../widgets/custom_edge_insets.dart';
import '../repo/profile_repo.dart';
import 'profile_editing_page.dart';
import 'this_user_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //TODO rewrite this part to use router
      stream: getIt<ProfileRepo>().getProfileStream(),
      builder: ((context, AsyncSnapshot<ShortReadUserModel?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.username == 'empty') {
            return const ProfileEditingPage();
          } else {
            return ThisUserProfilePage(shortProfile: snapshot.data!);
          }
        } else {
          return SafeArea(
            child: Center(
              child: const SignInPageButton(),
            ),
          );
        }
      }),
    );
  }
}

class SignInPageButton extends StatelessWidget {
  const SignInPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CEdgeInsets.horizontalStandart,
      child: PlatformElevatedButton(
        onPressed: () {
          context.router.push(
            const SignInRoute(),
          );
          // context.router.push(
          //   const ProfileEditingRoute(),
          // ),
        },
        child: const Text(
          'Sign in',
        ),
      ),
    );
  }
}
