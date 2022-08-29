import 'package:example/bloc/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpConfirmedPasswordWidget extends StatelessWidget {
  const SignUpConfirmedPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.checkField != current.checkField ||
          previous.confirmedPassword != current.confirmedPassword ||
          previous.showConfirmedPassword != current.showConfirmedPassword,
      builder: (context, state) {
        return SizedBox(
          width: 300.0,
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_open_rounded),
              hintText: 'Your password',
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  state.showConfirmedPassword
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                ),
                onPressed: () {
                  BlocProvider.of<SignUpCubit>(context)
                      .visibilityConfirmedChanged();
                },
              ),
              errorText: (!state.confirmedPassword.valid && state.checkField)
                  ? state.confirmedPassword.value == ''
                      ? 'Password can\'t be empty'
                      : 'invalid password'
                  : null,
            ),
            obscureText: state.showConfirmedPassword ? false : true,
            onChanged: (value) {
              BlocProvider.of<SignUpCubit>(context)
                  .confirmedPasswordChanged(value);
            },
            initialValue: state.confirmedPassword.value,
          ),
        );
      },
    );
  }
}
