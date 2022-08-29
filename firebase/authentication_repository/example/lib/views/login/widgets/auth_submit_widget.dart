import 'package:example/bloc/signin/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AuthSubmitWidget extends StatelessWidget {
  const AuthSubmitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninCubit, SigninState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == FormzStatus.submissionFailure) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? 'Erreur'),
            ),
          );
        } else if (state.status == FormzStatus.submissionSuccess) {
          BlocProvider.of<SigninCubit>(context).navigateRequested(true);
        }
      },
      child: ElevatedButton(
        onPressed: () =>
            BlocProvider.of<SigninCubit>(context).logInWithCredentials(),
        child: const Text(
          'Validate',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
