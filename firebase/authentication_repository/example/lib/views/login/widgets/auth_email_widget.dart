import 'package:example/bloc/signin/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthEmailWidget extends StatelessWidget {
  const AuthEmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninCubit, SigninState>(
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
              BlocProvider.of<SigninCubit>(context).emailChanged(value);
            },
            initialValue: state.email.value,
          ),
        );
      },
    );
  }
}
