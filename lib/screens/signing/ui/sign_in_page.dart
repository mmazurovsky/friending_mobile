import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ionicons/ionicons.dart';

import '../../../common/dependency_injection/dependency_injection.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuth = getIt<FirebaseAuth>();

    return SignInScreen(
      providers: FirebaseUIAuth.providersFor(
        firebaseAuth.app,
      ),
      auth: firebaseAuth,
      headerBuilder: (context, constraints, shrinkOffset) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            PlatformIconButton(
              onPressed: context.router.pop,
              icon: const Icon(Ionicons.arrow_back, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
