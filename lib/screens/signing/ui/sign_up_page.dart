import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import '../../../common/dependency_injection/dependency_injection.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuth = getIt<FirebaseAuth>();

    return RegisterScreen(
      providers: FirebaseUIAuth.providersFor(
        firebaseAuth.app,
      ),
      auth: firebaseAuth,
    );
  }
}
