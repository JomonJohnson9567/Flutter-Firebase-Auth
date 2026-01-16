import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_form/auth_form_bloc.dart';

class ConfirmPasswordInput extends StatelessWidget {
  const ConfirmPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthFormBloc, AuthFormState>(
      buildWhen: (previous, current) =>
          previous.isLoginMode != current.isLoginMode ||
          previous.confirmPasswordError != current.confirmPasswordError,
      builder: (context, state) {
        if (state.isLoginMode) return const SizedBox.shrink();
        return Column(
          children: [
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.blue),
                errorText: state.confirmPasswordError,
              ),
              obscureText: true,
              onChanged: (value) => context.read<AuthFormBloc>().add(
                AuthFormConfirmPasswordChanged(value),
              ),
            ),
          ],
        );
      },
    );
  }
}
