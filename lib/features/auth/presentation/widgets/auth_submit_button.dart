import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_task_auth/core/constants/app_colors.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_form/auth_form_bloc.dart';

class AuthSubmitButton extends StatelessWidget {
  const AuthSubmitButton({super.key});

  void _submit(BuildContext context, AuthFormState state) {
    if (state.isValid) {
      if (state.isLoginMode) {
        context.read<AuthBloc>().add(
          AuthLoginRequested(email: state.email, password: state.password),
        );
      } else {
        context.read<AuthBloc>().add(
          AuthRegisterRequested(
            name: state.name,
            email: state.email,
            password: state.password,
          ),
        );
      }
    } else {
      // Dispatch validation trigger to show errors
      context.read<AuthFormBloc>().add(AuthFormSubmitted());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in valid details.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return BlocBuilder<AuthFormBloc, AuthFormState>(
          builder: (context, formState) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.gradientStart, AppColors.gradientEnd],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gradientEnd.withOpacity(0.3),
                    blurRadius: 8.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () => _submit(context, formState),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Text(
                  formState.isLoginMode ? 'Login' : 'Register',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
