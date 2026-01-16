// widgets/error_state.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_task_auth/core/constants/app_colors.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64.r, color: AppColors.error),
          SizedBox(height: 16.h),
          Text(
            'Something went wrong!',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
