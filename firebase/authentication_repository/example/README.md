# Authentication Repository example

Inspired from Felix Angelov in [Flutter Firebase Login Tutorial](https://bloclibrary.dev/#/flutterfirebaselogintutorial)

Authentication repository example dependancies :

  - [Bloc](https://pub.dev/packages/flutter_bloc) : State management.
  - [Go Router](https://pub.dev/packages/go_router) : Navigation 2.0
  - [Formz](https://pub.dev/packages/formz) : Input validation


## Usage

initialise Firebase and AuthentificationRepository
```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOption.currentPlatform,
  );

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(AppView(authenticationRepository: authenticationRepository));
}
```

GoRouter : the bloc stream to refresh listenable.
```dart
class AppRouter {
  AppRouter(this.appContext);
  final BuildContext appContext;

  GoRouter appRouter() {
    return GoRouter(
      routes: <GoRoute>[
      ...
      ],
      // redirect to the login page if the user is not logged in
      redirect: (GoRouterState state) {
        final bool loggedIn =
            BlocProvider.of<AppBloc>(appContext).state.status ==
                AppStatus.authenticated;
        final bool loggingIn =
            (state.subloc == '/login') || (state.subloc == '/login/signup');
        if (!loggedIn) {
          return loggingIn ? null : '/login';
        }
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
```
AppBloc stream authentification repository when siginCubit send login request

```dart
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AppState.authenticated(authenticationRepository.currentUser)
              : const AppState.unauthenticated(),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(AppUserChanged(user)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(
      event.user.isNotEmpty
          ? AppState.authenticated(event.user)
          : const AppState.unauthenticated(),
    );
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
```