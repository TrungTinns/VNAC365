import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnac365/core/configs/assets/app_images.dart';
import 'package:vnac365/core/configs/theme/app_text.dart';

Widget iconic() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    SizedBox(
      height: 71.h,
    ),
    Image.asset(
      Img.logo,
      height: 106.h,
      width: 106.w,
      fit: BoxFit.cover,
    ),
    Text(
      'VNAC 365',
      style: AppText.iconicText,
    ),
  ]);
}
