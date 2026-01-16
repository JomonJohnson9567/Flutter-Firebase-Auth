
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_task_auth/core/constants/app_colors.dart';
import 'package:machine_task_auth/features/auth/presentation/bloc/auth_form/auth_form_bloc.dart';
 

class AuthHeader extends StatelessWidget {
  const AuthHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
      child: BlocBuilder<AuthFormBloc, AuthFormState>(
        builder: (context, state) {
          return Column(
            children: [
              Text(
                state.isLoginMode ? 'Welcome Back' : 'Create Account',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                state.isLoginMode
                    ? 'Sign in to continue'
                    : 'Sign up to get started',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.white.withOpacity(0.9),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
