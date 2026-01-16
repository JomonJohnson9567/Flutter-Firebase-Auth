import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_task_auth/core/constants/app_colors.dart';
import 'package:machine_task_auth/features/auth/presentation/pages/home/widget/custom_appbar.dart';
import 'package:machine_task_auth/features/auth/presentation/pages/home/widget/error_state.dart';
import 'package:machine_task_auth/features/auth/presentation/pages/home/widget/gradient_background.dart';
import 'package:machine_task_auth/features/auth/presentation/pages/home/widget/logout_button.dart';
import 'package:machine_task_auth/features/auth/presentation/pages/home/widget/logout_dialog.dart';
import 'package:machine_task_auth/features/auth/presentation/pages/home/widget/profile_avatar.dart';
import 'package:machine_task_auth/features/auth/presentation/pages/home/widget/welcome.dart';

import '../../bloc/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return GradientBackground(
              child: SafeArea(
                child: Column(
                  children: [
                    const CustomAppBar(),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10.h),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30.r)),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(24.0.r),
                            child: Column(
                              children: [
                                SizedBox(height: 20.h),
                                ProfileAvatar(
                                  displayName: state.user.displayName,
                                  email: state.user.email,
                                ),
                                SizedBox(height: 24.h),
                                WelcomeSection(
                                  displayName: state.user.displayName,
                                  email: state.user.email,
                                ),
                                SizedBox(height: 40.h),

                                SizedBox(height: 16.h),

                                SizedBox(height: 16.h),

                                SizedBox(height: 32.h),
                                LogoutButton(
                                  onPressed: () {
                                    LogoutDialog.show(context);
                                  },
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return const ErrorState();
        },
      ),
    );
  }
}
