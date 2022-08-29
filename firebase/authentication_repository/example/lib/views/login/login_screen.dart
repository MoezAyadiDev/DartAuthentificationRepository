import 'dart:math';

import 'package:example/views/login/widgets/auth_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = max(MediaQuery.of(context).size.height - 100, 300.0);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentification'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: height,
            width: width,
          ),
          child: const AuthForm(),
        ),
      ),
    );
  }
}
