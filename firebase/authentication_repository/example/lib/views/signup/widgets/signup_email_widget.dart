import 'package:example/bloc/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpEmailWidget extends StatelessWidget {
  const SignUpEmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.email != current.email ||
          previous.checkField != current.checkField,
      builder: (context, state) {
        return SizedBox(
          width: 300.0,
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email_rounded),
              hintText: 'Your mail adress',
              labelText: 'Email',
              errorText: (!state.email.valid && state.checkField)
                  ? state.email.value == ''
                      ? 'Email can\'t be empty'
                      : 'invalid username'
                  : null,
            ),
            onChanged: (value) {
              BlocProvider.of<SignUpCubit>(context).emailChanged(value);
            },
            initialValue: state.email.value,
          ),
        );
      },
    );
  }
}
