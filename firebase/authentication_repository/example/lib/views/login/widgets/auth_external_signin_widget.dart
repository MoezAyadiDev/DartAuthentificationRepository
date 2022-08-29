import 'package:example/bloc/signin/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExternalSigninWidget extends StatelessWidget {
  const ExternalSigninWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        IconButton(
          onPressed: () {
            BlocProvider.of<SigninCubit>(context).logInWithGoogle();
          },
          icon: const FaIcon(FontAwesomeIcons.google),
        ),
        IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.facebook),
        ),
        IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.apple),
        ),
      ],
    );
  }
}
