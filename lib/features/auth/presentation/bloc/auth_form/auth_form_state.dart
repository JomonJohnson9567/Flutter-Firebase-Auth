part of 'auth_form_bloc.dart';

class AuthFormState extends Equatable {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isLoginMode;
  final String? nameError;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;
  final bool isValid;
  final bool showErrors;

  const AuthFormState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isLoginMode = true,
    this.nameError,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
    this.isValid = false,
    this.showErrors = false,
  });

  AuthFormState copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isLoginMode,
    String? nameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    bool? isValid,
    bool? showErrors,
  }) {
    return AuthFormState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isLoginMode: isLoginMode ?? this.isLoginMode,
      nameError: nameError,
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
      isValid: isValid ?? this.isValid,
      showErrors: showErrors ?? this.showErrors,
    );
  }

  @override
  List<Object?> get props => [
    name,
    email,
    password,
    confirmPassword,
    isLoginMode,
    nameError,
    emailError,
    passwordError,
    confirmPasswordError,
    isValid,
    showErrors,
  ];
}
