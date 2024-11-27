import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnac365/core/configs/theme/app_colors.dart';
import 'package:vnac365/core/configs/theme/app_text.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final FocusNode node;

  AuthTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.node,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(minWidth:327, maxWidth: double.infinity, minHeight: 52, maxHeight: double.infinity),
      height: 52,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16.r), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurStyle: BlurStyle.inner,
          spreadRadius: 1,
          blurRadius: 10,
        )
      ]),
      child: TextField(
        controller: controller,
        focusNode: node,
        style: AppText.questText,
        keyboardType: TextInputType.phone,
        cursorWidth: 1.w,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: AppColors.secondary,
          ),
          hintText: hintText,
          hintStyle: AppText.hintText,
          filled: true,
          fillColor: AppColors.white,
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
