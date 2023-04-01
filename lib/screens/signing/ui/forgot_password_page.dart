import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import '../../../common/dependency_injection/dependency_injection.dart';
import '../../widgets/app_bar.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuth = getIt<FirebaseAuth>();

    return ForgotPasswordScreen(
      auth: firebaseAuth,
      headerBuilder: (context, constraints, shrinkOffset) =>
          const CustomAppBarWithBackButton(),
    );
  }
}
