import 'package:authentication_repository/authentication_repository.dart';
import 'package:example/bloc/app/app_bloc.dart';
import 'package:example/bloc/signin/signin_cubit.dart';
import 'package:example/services/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatelessWidget {
  final AuthenticationRepository _authenticationRepository;
  const AppView({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (BuildContext context) =>
                AppBloc(authenticationRepository: _authenticationRepository),
          ),
          BlocProvider<SigninCubit>(
            create: (BuildContext context) =>
                SigninCubit(_authenticationRepository),
          ),
        ],
        child: Builder(
          builder: (context) {
            var appRouter = AppRouter(context).appRouter();
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routeInformationProvider: appRouter.routeInformationProvider,
              routeInformationParser: appRouter.routeInformationParser,
              routerDelegate: appRouter.routerDelegate,
            );
          },
        ),
      ),
    );
  }
}
