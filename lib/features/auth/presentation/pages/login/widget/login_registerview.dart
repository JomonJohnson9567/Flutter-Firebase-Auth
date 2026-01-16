import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_task_auth/core/constants/app_colors.dart';
import 'package:machine_task_auth/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:machine_task_auth/features/auth/presentation/pages/home/widget/gradient_background.dart';
import 'package:machine_task_auth/features/auth/presentation/pages/login/widget/auth_form.dart';
import 'package:machine_task_auth/features/auth/presentation/pages/login/widget/auth_headet.dart';
 

class LoginRegisterView extends StatelessWidget {
  const LoginRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        child: GradientBackground(
          child: SafeArea(
            child: Column(
              children: [
                const AuthHeader(),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const SingleChildScrollView(
                      padding: EdgeInsets.all(24.0),
                      child: AuthFormContent(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
