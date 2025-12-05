import 'package:depi_project/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.label, required this.statusColor});

  final String label;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: AppTheme.white,
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
        ),
      ),
      backgroundColor: statusColor,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
    );
  }
}
