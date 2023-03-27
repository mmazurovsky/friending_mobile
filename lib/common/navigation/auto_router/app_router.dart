import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../screens/signing/ui/forgot_password_page.dart';
import '../../../screens/signing/ui/sign_in_page.dart';
import '../../../screens/signing/ui/sign_up_page.dart';

import '../../../screens/main/ui/main_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainPage, initial: true),
    AutoRoute(
      page: SignInPage,
    ),
    AutoRoute(
      page: SignUpPage,
    ),
    AutoRoute(
      page: ForgotPasswordPage,
    ),
  ],
)
// extend the generated private router
@lazySingleton
class AppRouter extends _$AppRouter {}
