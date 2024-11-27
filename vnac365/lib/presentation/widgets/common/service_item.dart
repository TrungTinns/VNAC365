import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vnac365/core/configs/theme/app_colors.dart';
import 'package:vnac365/core/configs/theme/app_text.dart';
import 'package:spring_button/spring_button.dart';
import 'package:vnac365/presentation/widgets/common/item_with_shadow.dart';

class ServiceItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final int count;
  final VoidCallback
      onTap; //dùng cho các sự kiện không yêu cầu tham số, như nhấn nút hoặc chạm
  // final Function()? onTap; //sử dụng các hàm callback có tham số hoặc trả về giá trị.

  const ServiceItem({
    required this.imagePath,
    required this.label,
    required this.count,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: SpringButton(
        SpringButtonType.OnlyScale, // Chỉ scale khi nhấn
        onTap: onTap, // Gọi callback khi nhấn
        // onTap: () { onTap?.call() }; // Kiểm tra null trước khi gọi
        Stack(
          alignment: Alignment.topLeft,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -16,
              left: 30,
              child: itemWithShadow(imagePath),
            ),
            Positioned(
              top: 33,
              left: 150,
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(label, style: AppText.f16w500),
                    Text('$count bài', style: AppText.f16w400),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
