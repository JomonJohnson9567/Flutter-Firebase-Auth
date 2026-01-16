import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/auth_form/auth_form_bloc.dart';

class AuthToggleButton extends StatelessWidget {
  const AuthToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthFormBloc, AuthFormState>(
      builder: (context, state) {
        return TextButton(
          onPressed: () =>
              context.read<AuthFormBloc>().add(AuthFormToggleMode()),
          child: Text(
            state.isLoginMode
                ? 'Don\'t have an account? Register'
                : 'Already have an account? Login',
            style: TextStyle(fontSize: 14.sp),
          ),
        );
      },
    );
  }
}
