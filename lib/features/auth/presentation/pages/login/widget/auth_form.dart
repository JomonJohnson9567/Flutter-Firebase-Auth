import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_task_auth/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:machine_task_auth/features/auth/presentation/widgets/auth_toggle_button.dart';
import 'package:machine_task_auth/features/auth/presentation/widgets/confirm_password_input.dart';
import 'package:machine_task_auth/features/auth/presentation/widgets/email_input.dart';
import 'package:machine_task_auth/features/auth/presentation/widgets/name_input.dart';
import 'package:machine_task_auth/features/auth/presentation/widgets/password_input.dart';

class AuthFormContent extends StatelessWidget {
  const AuthFormContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const NameInput(),
        const EmailInput(),
        SizedBox(height: 16.h),
        const PasswordInput(),
        const ConfirmPasswordInput(),
        SizedBox(height: 24.h),
        const AuthSubmitButton(),
        SizedBox(height: 16.h),
        const AuthToggleButton(),
      ],
    );
  }
}
