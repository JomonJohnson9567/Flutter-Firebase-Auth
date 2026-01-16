import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_task_auth/core/constants/app_colors.dart';
import 'package:machine_task_auth/features/auth/presentation/pages/home/widget/custom_appbar.dart';
import 'package:machine_task_auth/features/auth/presentation/pages/home/widget/error_state.dart';
import 'package:machine_task_auth/features/auth/presentation/pages/home/widget/gradient_background.dart';
import 'package:machine_task_auth/features/auth/presentation/pages/home/widget/logout_button.dart';
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
                        margin: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                ProfileAvatar(
                                  displayName: state.user.displayName,
                                  email: state.user.email,
                                ),
                                const SizedBox(height: 24),
                                WelcomeSection(
                                  displayName: state.user.displayName,
                                  email: state.user.email,
                                ),
                                const SizedBox(height: 40),

                                const SizedBox(height: 16),

                                const SizedBox(height: 16),

                                const SizedBox(height: 32),
                                LogoutButton(
                                  onPressed: () {
                                    context.read<AuthBloc>().add(
                                      AuthLogoutRequested(),
                                    );
                                  },
                                ),
                                const SizedBox(height: 20),
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
