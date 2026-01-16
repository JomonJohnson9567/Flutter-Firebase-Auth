import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_task_auth/features/auth/presentation/bloc/auth_form/auth_form_bloc.dart';
import 'package:machine_task_auth/features/auth/presentation/pages/login/widget/login_registerview.dart';
 
import '../../../../../core/di/injection_container.dart';

class LoginRegisterPage extends StatelessWidget {
  const LoginRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthFormBloc>(
      create: (_) => sl<AuthFormBloc>(),
      child: const LoginRegisterView(),
    );
  }
}
