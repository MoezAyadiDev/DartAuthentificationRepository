part of 'signup_cubit.dart';

enum ConfirmPasswordValidationError { invalid }

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
    this.checkField = false,
    this.showPassword = false,
    this.showConfirmedPassword = false,
  });

  final Email email;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final FormzStatus status;
  final String? errorMessage;
  final bool checkField;
  final bool showPassword;
  final bool showConfirmedPassword;
  @override
  List<Object> get props => [
        email,
        password,
        confirmedPassword,
        status,
        checkField,
        showPassword,
        showConfirmedPassword,
      ];

  SignUpState copyWith({
    Email? email,
    Password? password,
    ConfirmedPassword? confirmedPassword,
    FormzStatus? status,
    String? errorMessage,
    bool? checkField,
    bool? showPassword,
    bool? showConfirmedPassword,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      checkField: checkField ?? this.checkField,
      showPassword: showPassword ?? this.showPassword,
      showConfirmedPassword:
          showConfirmedPassword ?? this.showConfirmedPassword,
    );
  }
}
