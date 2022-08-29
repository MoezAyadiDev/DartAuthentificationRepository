import 'package:flutter/material.dart';

import 'auth_widget.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Spacer(flex: 3),
        AuthEmailWidget(),
        Spacer(flex: 1),
        AuthPasswordWidget(),
        Spacer(flex: 2),
        AuthSubmitWidget(),
        Spacer(flex: 2),
        AuthSignUpWidget(),
        Spacer(flex: 1),
        ExternalSigninWidget(),
        Spacer(flex: 3),
      ],
    );
  }
}
