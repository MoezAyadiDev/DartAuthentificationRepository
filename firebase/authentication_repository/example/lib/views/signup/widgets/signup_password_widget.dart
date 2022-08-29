import 'package:example/bloc/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPasswordWidget extends StatelessWidget {
  const SignUpPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.checkField != current.checkField ||
          previous.password != current.password ||
          previous.showPassword != current.showPassword,
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
                  state.showPassword
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                ),
                onPressed: () {
                  BlocProvider.of<SignUpCubit>(context).visibilityChanged();
                },
              ),
              errorText: (!state.password.valid && state.checkField)
                  ? state.email.value == ''
                      ? 'Password can\'t be empty'
                      : 'invalid password'
                  : null,
            ),
            obscureText: state.showPassword ? false : true,
            onChanged: (value) {
              BlocProvider.of<SignUpCubit>(context).passwordChanged(value);
            },
            initialValue: state.password.value,
          ),
        );
      },
    );
  }
}
