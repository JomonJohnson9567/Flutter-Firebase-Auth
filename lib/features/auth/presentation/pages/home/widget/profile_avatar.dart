// widgets/profile_avatar.dart
import 'package:flutter/material.dart';
import 'package:machine_task_auth/core/constants/app_colors.dart';
 
class ProfileAvatar extends StatelessWidget {
  final String displayName;
  final String email;

  const ProfileAvatar({
    super.key,
    required this.displayName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [AppColors.avatarGradientStart, AppColors.avatarGradientEnd],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.avatarShadow,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: Text(
          displayName.isNotEmpty
              ? displayName[0].toUpperCase()
              : email[0].toUpperCase(),
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
