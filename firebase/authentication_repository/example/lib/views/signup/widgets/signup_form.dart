import 'package:example/views/signup/widgets/signup_widget.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Spacer(flex: 3),
        SignUpEmailWidget(),
        Spacer(flex: 1),
        SignUpPasswordWidget(),
        Spacer(flex: 1),
        SignUpConfirmedPasswordWidget(),
        Spacer(flex: 2),
        SignUpSubmitWidget(),
        Spacer(flex: 3),
      ],
    );
  }
}
