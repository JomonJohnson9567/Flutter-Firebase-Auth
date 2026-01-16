import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_task_auth/core/constants/app_colors.dart';
import 'package:machine_task_auth/features/auth/presentation/bloc/auth_form/auth_form_bloc.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 40.h, 24.w, 40.h),
      child: BlocBuilder<AuthFormBloc, AuthFormState>(
        builder: (context, state) {
          return Column(
            children: [
              Text(
                state.isLoginMode ? 'Welcome Back' : 'Create Account',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                state.isLoginMode
                    ? 'Sign in to continue'
                    : 'Sign up to get started',
                style: TextStyle(
                  fontSize: 16.sp,
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
