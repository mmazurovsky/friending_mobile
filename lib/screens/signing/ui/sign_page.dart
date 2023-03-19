import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import '../../../common/dependency_injection/dependency_injection.dart';

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providers: FirebaseUIAuth.providersFor(
        getIt<FirebaseAuth>().app,
      ),
      auth: getIt<FirebaseAuth>(),
    );
  }
}
