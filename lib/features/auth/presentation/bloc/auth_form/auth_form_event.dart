part of 'auth_form_bloc.dart';

abstract class AuthFormEvent extends Equatable {
  const AuthFormEvent();

  @override
  List<Object> get props => [];
}

class AuthFormNameChanged extends AuthFormEvent {
  final String name;
  const AuthFormNameChanged(this.name);

  @override
  List<Object> get props => [name];
}

class AuthFormEmailChanged extends AuthFormEvent {
  final String email;
  const AuthFormEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class AuthFormPasswordChanged extends AuthFormEvent {
  final String password;
  const AuthFormPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class AuthFormConfirmPasswordChanged extends AuthFormEvent {
  final String confirmPassword;
  const AuthFormConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object> get props => [confirmPassword];
}

class AuthFormToggleMode extends AuthFormEvent {}

class AuthFormSubmitted extends AuthFormEvent {}
