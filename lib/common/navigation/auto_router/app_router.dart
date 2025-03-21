import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../screens/auth/ui/forgot_password_page.dart';
import '../../../screens/auth/ui/sign_in_page.dart';
import '../../../screens/events/ui/events_page.dart';
import '../../../screens/explore/ui/explore_page.dart';
import '../../../screens/front_page.dart';
import '../../../screens/other_user/ui/other_user_profile_page.dart';
import '../../../screens/profile/ui/profile_editing_page.dart';
import '../../../screens/profile/ui/profile_page.dart';
import '../../../screens/profile/ui/this_user_profile_page.dart';
import '../../data/models/user_models.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: FrontPage,
      initial: true,
      children: [
        AutoRoute(
          page: ExplorePage,
        ),
        AutoRoute(
          page: EventsPage,
        ),
        AutoRoute(
          page: ProfilePage,
          children: [
            AutoRoute(
              page: SignInPage,
            ),
            AutoRoute(
              page: ThisUserProfilePage,
            ),
          ],
        ),
      ],
    ),
    AutoRoute(
      page: ForgotPasswordPage,
    ),
    AutoRoute(
      page: OtherUserProfilePage,
    ),
    AutoRoute(
      page: ProfileEditingPage,
    ),
  ],
)
// extend the generated private router
@lazySingleton
class AppRouter extends _$AppRouter {}
