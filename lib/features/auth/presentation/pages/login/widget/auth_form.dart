import 'package:flutter/material.dart';
import 'package:machine_task_auth/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:machine_task_auth/features/auth/presentation/widgets/auth_toggle_button.dart';
import 'package:machine_task_auth/features/auth/presentation/widgets/confirm_password_input.dart';
import 'package:machine_task_auth/features/auth/presentation/widgets/email_input.dart';
import 'package:machine_task_auth/features/auth/presentation/widgets/name_input.dart';
import 'package:machine_task_auth/features/auth/presentation/widgets/password_input.dart';
 
class AuthFormContent extends StatelessWidget {
  const AuthFormContent();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NameInput(),
        EmailInput(),
        SizedBox(height: 16),
        PasswordInput(),
        ConfirmPasswordInput(),
        SizedBox(height: 24),
        AuthSubmitButton(),
        SizedBox(height: 16),
        AuthToggleButton(),
      ],
    );
  }
}
