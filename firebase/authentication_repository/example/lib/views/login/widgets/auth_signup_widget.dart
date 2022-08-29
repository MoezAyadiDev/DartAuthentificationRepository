import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthSignUpWidget extends StatelessWidget {
  const AuthSignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.go('/login/signup');
      },
      child: const Text('SignUp'),
    );
  }
}
