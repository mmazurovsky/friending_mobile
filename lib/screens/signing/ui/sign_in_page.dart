import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
