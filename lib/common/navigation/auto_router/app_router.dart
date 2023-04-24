import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../screens/auth/ui/forgot_password_page.dart';
import '../../../screens/auth/ui/sign_in_page.dart';
import '../../../screens/events/ui/events_page.dart';
import '../../../screens/explore/ui/explore_page.dart';
import '../../../screens/front_page.dart';
import '../../../screens/profile/ui/profile_editing_page.dart';
import '../../../screens/profile/ui/profile_page.dart';

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
        ),
      ],
    ),
    AutoRoute(
      page: ProfileEditingPage,
    ),
    AutoRoute(
      page: SignInPage,
    ),
    AutoRoute(
      page: ForgotPasswordPage,
    ),
  ],
)
// extend the generated private router
@lazySingleton
class AppRouter extends _$AppRouter {}
