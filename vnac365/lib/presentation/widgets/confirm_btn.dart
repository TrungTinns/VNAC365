import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnac365/core/configs/theme/app_colors.dart';
import 'package:vnac365/core/configs/theme/app_text.dart';

class ConfirmBtn extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const ConfirmBtn({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: TextButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Color.fromARGB(179, 11, 0, 96),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h),
          elevation: 2,
        ),
        child: Text(
          text,
          style: AppText.btnText,
        ),
      ),
    );
  }
}
