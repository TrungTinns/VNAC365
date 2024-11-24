import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vnac365/core/configs/assets/app_images.dart';
import 'package:vnac365/core/configs/theme/app_colors.dart';
import 'package:vnac365/core/configs/theme/app_text.dart';
import 'package:vnac365/presentation/home/controller/home_controller.dart';
import 'package:vnac365/presentation/widgets/service_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        //this color must be equal to the WaterDropNavBar backgroundColor
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          surfaceTintColor: AppColors.white,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nguyễn Xuân', style: AppText.userName),
                Text(
                  'Xin chào bạn đến với VNAC-365',
                  style: AppText.welcome,
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: CircleAvatar(
                backgroundImage: AssetImage(Img.logo),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
          ),
          child: GridView.count(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 10.w),
            crossAxisCount: 2,
            mainAxisSpacing: 32.h,
            crossAxisSpacing: 17.w,
            children: [
              ServiceItem(
                onTap: homeController.gotoActive,
                label: 'BAY',
                imagePath: Img.paperplane,
              ),
              ServiceItem(
                onTap: homeController.gotoQuiz,
                label: 'KIỂM TRA',
                imagePath: Img.folders,
              ),
              ServiceItem(
                onTap: () {},
                label: 'THỰC HÀNH',
                imagePath: Img.sandclock,
              ),
              ServiceItem(
                onTap: homeController.gotoHistory,
                label: 'BÀI THI ĐÃ LÀM',
                imagePath: Img.folder,
              ),
              ServiceItem(
                onTap: () {},
                label: 'ĐANG CHỜ',
                imagePath: Img.chronometer,
              ),
              ServiceItem(
                onTap: () {},
                label: 'HỖ TRỢ',
                imagePath: Img.teamsupport,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
