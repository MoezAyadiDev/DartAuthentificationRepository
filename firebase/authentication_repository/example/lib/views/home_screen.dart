import 'package:example/bloc/app/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<AppBloc>(context).add(AppLogoutRequested());
            },
            icon: const FaIcon(FontAwesomeIcons.arrowUpRightFromSquare),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Welcome ${BlocProvider.of<AppBloc>(context).state.user.email}',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
