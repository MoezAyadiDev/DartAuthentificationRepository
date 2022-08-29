import 'package:authentication_repository/authentication_repository.dart';
import 'package:example/services/value_object/email.dart';
import 'package:example/services/value_object/password.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authenticationRepository) : super(const SigninState());

  final AuthenticationRepository authenticationRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  visibilityChanged() {
    emit(
      state.copyWith(
        showPassword: !state.showPassword,
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    if (!state.status.isValidated) {
      emit(
        state.copyWith(
          checkField: true,
          status: FormzStatus.submissionFailure,
          errorMessage: 'Check the input',
        ),
      );
      return;
    }
    emit(state.copyWith(
        status: FormzStatus.submissionInProgress, canNavigate: false));
    try {
      await authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzStatus.submissionFailure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await authenticationRepository.logInWithGoogle();
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on LogInWithGoogleFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzStatus.submissionFailure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  navigateRequested(bool canNavigate) {
    emit(state.copyWith(canNavigate: canNavigate));
  }
}
