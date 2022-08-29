part of 'signin_cubit.dart';

class SigninState extends Equatable {
  const SigninState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
    this.showPassword = false,
    this.checkField = false,
    final this.canNavigate = false,
  });

  final Email email;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;
  final bool showPassword;
  final bool checkField;
  final bool canNavigate;

  SigninState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    String? errorMessage,
    bool? showPassword,
    bool? checkField,
    bool? canNavigate,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      showPassword: showPassword ?? this.showPassword,
      checkField: checkField ?? this.checkField,
      canNavigate: canNavigate ?? this.canNavigate,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        status,
        showPassword,
        checkField,
        canNavigate,
      ];
}
