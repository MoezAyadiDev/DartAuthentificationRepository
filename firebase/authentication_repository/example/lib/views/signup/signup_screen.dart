import 'dart:math';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:example/bloc/signup/signup_cubit.dart';
import 'package:example/views/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = max(MediaQuery.of(context).size.height - 100, 300.0);
    final width = max(MediaQuery.of(context).size.width - 100, 1000.0);
    return BlocProvider(
      create: (context) =>
          SignUpCubit(context.read<AuthenticationRepository>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign up'),
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              height: height,
              width: width,
            ),
            child: const SignUpForm(),
          ),
        ),
      ),
    );
  }
}
