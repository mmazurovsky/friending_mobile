import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../screens/main/ui/main_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainPage, initial: true),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
