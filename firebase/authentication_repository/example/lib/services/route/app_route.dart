import 'package:example/bloc/app/app_bloc.dart';
import 'package:example/views/home_screen.dart';
import 'package:example/views/login/login_screen.dart';
import 'package:example/views/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter(this.appContext);
  final BuildContext appContext;
  GoRouter appRouter() {
    return GoRouter(
      debugLogDiagnostics: true,
      routes: <GoRoute>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const HomeScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (BuildContext context, GoRouterState state) =>
              const LoginScreen(),
          routes: [
            GoRoute(
              path: 'signup',
              builder: (BuildContext context, GoRouterState state) =>
                  const SignUpScreen(),
            ),
          ],
        ),
      ],

      // redirect to the login page if the user is not logged in
      redirect: (GoRouterState state) {
        // if the user is not logged in, they need to login
        final bool loggedIn =
            BlocProvider.of<AppBloc>(appContext).state.status ==
                AppStatus.authenticated;
        final bool loggingIn =
            (state.subloc == '/login') || (state.subloc == '/login/signup');
        if (!loggedIn) {
          return loggingIn ? null : '/login';
        }

        // if the user is logged in but still on the login page, send them to
        // the home page
        if (loggingIn) {
          return '/';
        }

        // no need to redirect at all
        return null;
      },

      // changes on the listenable will cause the router to refresh it's route
      refreshListenable:
          GoRouterRefreshStream(BlocProvider.of<AppBloc>(appContext).stream),
    );
  }
}
