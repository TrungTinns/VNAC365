import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnac365/core/configs/theme/app_colors.dart';
import 'package:vnac365/core/configs/theme/app_text.dart';

class ServiceItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap; //dùng cho các sự kiện không yêu cầu tham số, như nhấn nút hoặc chạm
  // final Function()? onTap; //sử dụng các hàm callback có tham số hoặc trả về giá trị.

  const ServiceItem({
    required this.imagePath,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // onTap: () {
      //   onTap?.call(); // Kiểm tra null trước khi gọi
      // },
      child: Stack(
        alignment: Alignment.topLeft,
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 24.h, left: 16.w),
                child: Text(label, style: AppText.service),
              ),
            ),
          ),
          Positioned(
            top: -20.h,
            left: 16.w,
            child: Image.asset(
              imagePath,
              width: 93.w,
              height: 93.h,
            ),
          ),
          Positioned(
            top: 60.h,
            left: 22.w,
            child: Container(
              width: 70.w,
              height: 8.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.questColor.withOpacity(0.2),
                    blurRadius: 14,
                    spreadRadius: 4,
                    offset: Offset(2, 10),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
