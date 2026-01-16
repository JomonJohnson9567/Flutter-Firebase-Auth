import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth_bloc.dart';
import '../home/home_page.dart';
import '../login/login_register_page.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return const HomePage();
        } else if (state is AuthLoading) { 
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return const LoginRegisterPage();
      },
      buildWhen: (previous, current) {
    

        return current is Authenticated ||
            current is Unauthenticated ||
            current is AuthInitial;
    
      },
    );
  }
}
