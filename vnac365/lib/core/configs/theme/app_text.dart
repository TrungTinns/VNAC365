import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnac365/core/configs/theme/app_colors.dart';

class AppText {
  static final iconicText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static final guideText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    color: AppColors.insideColor,
  );

  static final hintText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.hintColor,
  );

  static final btnText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static final questText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.questColor,
  );

  static final pickText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.questColor,
  );

  static final correctAnswer = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );

  static final incorrectAnswer = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.incorrect,
  );

  static final info = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.info);

  static final userName = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.questColor,
  );

  static final welcome = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.welcome,
  );

  static final service = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.questColor,
  );

  static final quizCount = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.secondary,
  );
}
