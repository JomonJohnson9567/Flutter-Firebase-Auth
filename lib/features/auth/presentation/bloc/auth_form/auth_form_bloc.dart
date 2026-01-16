import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_form_event.dart';
part 'auth_form_state.dart';

class AuthFormBloc extends Bloc<AuthFormEvent, AuthFormState> {
  AuthFormBloc() : super(const AuthFormState()) {
    on<AuthFormNameChanged>(_onNameChanged);
    on<AuthFormEmailChanged>(_onEmailChanged);
    on<AuthFormPasswordChanged>(_onPasswordChanged);
    on<AuthFormConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<AuthFormToggleMode>(_onToggleMode);
    on<AuthFormSubmitted>(_onSubmitted);
  }

  void _onNameChanged(AuthFormNameChanged event, Emitter<AuthFormState> emit) {
    emit(state.copyWith(name: event.name));
    _validate(emit, name: event.name);
  }

  void _onEmailChanged(
    AuthFormEmailChanged event,
    Emitter<AuthFormState> emit,
  ) {
    emit(state.copyWith(email: event.email));
    _validate(emit, email: event.email);
  }

  void _onPasswordChanged(
    AuthFormPasswordChanged event,
    Emitter<AuthFormState> emit,
  ) {
    emit(state.copyWith(password: event.password));
    _validate(emit, password: event.password);
  }

  void _onConfirmPasswordChanged(
    AuthFormConfirmPasswordChanged event,
    Emitter<AuthFormState> emit,
  ) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
    _validate(emit, confirmPassword: event.confirmPassword);
  }

  void _onToggleMode(AuthFormToggleMode event, Emitter<AuthFormState> emit) {
    emit(
      state.copyWith(
        isLoginMode: !state.isLoginMode,
        // Clear errors on toggle
        nameError: null,
        emailError: null,
        passwordError: null,
        confirmPasswordError: null,
        showErrors: false,
      ),
    );
    _validate(emit);
  }

  void _onSubmitted(AuthFormSubmitted event, Emitter<AuthFormState> emit) {
    emit(state.copyWith(showErrors: true));
    _validate(emit);
  }

  void _validate(
    Emitter<AuthFormState> emit, {
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    // Current values from state unless overridden by argument
    final currentName = name ?? state.name;
    final currentEmail = email ?? state.email;
    final currentPassword = password ?? state.password;
    final currentConfirmPassword = confirmPassword ?? state.confirmPassword;
    final isLogin = state.isLoginMode;

    String? nameErr;
    String? emailErr;
    String? passErr;
    String? confirmErr;

    // Validate Name (only if Register)
    if (!isLogin && currentName.isEmpty) {
      nameErr = 'Please enter your name';
    }

    // Validate Email
    if (currentEmail.isEmpty) {
      emailErr = 'Please enter your email';
    } else {
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );
      if (!emailRegex.hasMatch(currentEmail)) {
        emailErr = 'Please enter a valid email address';
      }
    }

    // Validate Password
    if (currentPassword.isEmpty) {
      passErr = 'Please enter a password';
    } else if (currentPassword.length < 6) {
      passErr = 'Password must be at least 6 characters';
    }

    // Validate Confirm Password (only if Register)
    if (!isLogin) {
      if (currentConfirmPassword.isEmpty) {
        confirmErr = 'Please confirm your password';
      } else if (currentConfirmPassword != currentPassword) {
        confirmErr = 'Passwords do not match';
      }
    }

    // Calculate Is Valid
    final isValid = (isLogin
        ? (emailErr == null &&
              passErr == null &&
              currentEmail.isNotEmpty &&
              currentPassword.isNotEmpty)
        : (nameErr == null &&
              emailErr == null &&
              passErr == null &&
              confirmErr == null &&
              currentName.isNotEmpty &&
              currentEmail.isNotEmpty &&
              currentPassword.isNotEmpty &&
              currentConfirmPassword.isNotEmpty));

    // Only emit error strings if showErrors is true
    emit(
      state.copyWith(
        nameError: state.showErrors ? nameErr : null,
        emailError: state.showErrors ? emailErr : null,
        passwordError: state.showErrors ? passErr : null,
        confirmPasswordError: state.showErrors ? confirmErr : null,
        isValid: isValid,
      ),
    );
  }
}
