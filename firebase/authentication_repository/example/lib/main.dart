import 'package:authentication_repository/authentication_repository.dart';
import 'package:example/bloc/observer/bloc_observer.dart';
import 'package:example/services/firebase/firebase_options.dart';
import 'package:example/views/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
