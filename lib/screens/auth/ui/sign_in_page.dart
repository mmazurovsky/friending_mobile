import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import '../../../common/dependency_injection/dependency_injection.dart';
import '../../../common/navigation/auto_router/app_router.dart';
import '../../widgets/app_bar/app_bar.dart';

class SignInPage extends StatelessWidget {
  final bool withBackButton;
  const SignInPage({
    super.key,
    this.withBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    });
    final firebaseAuth = getIt<FirebaseAuth>();

    return SignInScreen( 
      providers: FirebaseUIAuth.providersFor(
        firebaseAuth.app,
      ),
      auth: firebaseAuth,
      
      actions: [
        ForgotPasswordAction(
          (context, email) {
            context.router.push(const ForgotPasswordRoute());
          },
        ),
      ],
      headerBuilder: (context, constraints, shrinkOffset) => withBackButton ? const CustomAppBarWithBackButton() : const SizedBox(),
    );
  }
}
