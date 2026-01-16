// widgets/welcome_section.dart
import 'package:flutter/material.dart';
import 'package:machine_task_auth/core/constants/app_colors.dart';
 
class WelcomeSection extends StatelessWidget {
  final String displayName;
  final String email;

  const WelcomeSection({
    super.key,
    required this.displayName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome!',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          displayName,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: AppColors.textBlue,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.backgroundLight,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            email,
            style: TextStyle(fontSize: 16, color: AppColors.textGrey),
          ),
        ),
      ],
    );
  }
}
