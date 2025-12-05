import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.keyboardType,
    required this.obscureText,
    this.suffixIcon,
    this.onSaved,
    this.validator,
    this.maxLines = 1,
  });
  final String labelText;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    // الحصول على مخطط الألوان ونصوص الثيم
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ⭐ labelText يستخدم bodyLarge من الثيم (يتغير لونه تلقائياً)
        Text(labelText, style: textTheme.bodyLarge),
        SizedBox(height: 8.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: maxLines == 1 ? 55.h : 55.h * maxLines,
                  ),
                  // ⭐ استخدام ألوان الثيم للخلفية والحدود
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey.shade800
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey.shade700
                          : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
              TextFormField(
                validator:
                    validator ??
                    (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).fieldRequired;
                      }
                      return null;
                    },
                onSaved: onSaved,
                keyboardType: keyboardType,
                obscureText: obscureText,
                maxLines: maxLines,
                // ⭐ نص الإدخال يستخدم bodyMedium من الثيم
                style: textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                decoration: InputDecoration(
                  suffixIcon: suffixIcon,
                  hintText: hintText,
                  // ⭐ hintStyle يستخدم bodyMedium من الثيم مع شفافية
                  hintStyle: textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey.shade400
                        : Colors.grey.shade600,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 12.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
