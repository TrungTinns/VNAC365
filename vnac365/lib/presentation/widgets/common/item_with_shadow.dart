import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnac365/core/configs/theme/app_colors.dart';

Widget itemWithShadow(String imagePath) {
  return Column(
    children: [
      Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          width: 70,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: AppColors.questColor.withOpacity(0.3),
                blurRadius: 14,
                spreadRadius: 4,
                offset: const Offset(2, 10),
              ),
            ],
          ),
        ),
        Positioned(
          child: Image.asset(
            imagePath,
            width: 90,
            height: 90,
          ),
        ),
      ])
    ],
  );
}
