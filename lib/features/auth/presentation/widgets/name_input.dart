import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/auth_form/auth_form_bloc.dart';

class NameInput extends StatelessWidget {
  const NameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthFormBloc, AuthFormState>(
      buildWhen: (previous, current) =>
          previous.isLoginMode != current.isLoginMode ||
          previous.nameError != current.nameError,
      builder: (context, state) {
        if (state.isLoginMode) return const SizedBox.shrink();
        return Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 16.h,
                ),
                prefixIcon: const Icon(Icons.person, color: Colors.blue),
                errorText: state.nameError,
              ),
              onChanged: (value) =>
                  context.read<AuthFormBloc>().add(AuthFormNameChanged(value)),
            ),
            SizedBox(height: 16.h),
          ],
        );
      },
    );
  }
}
