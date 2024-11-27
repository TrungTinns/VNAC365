import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vnac365/core/configs/assets/app_images.dart';
import 'package:vnac365/core/configs/theme/app_colors.dart';
import 'package:vnac365/core/configs/theme/app_text.dart';
import 'package:vnac365/data/models/service_model.dart';
import 'package:vnac365/presentation/home/controller/home_controller.dart';
import 'package:vnac365/presentation/widgets/common/service_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final services = Services.services(homeController);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        //this color must be equal to the WaterDropNavBar backgroundColor
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightBackground,
        appBar: AppBar(
          surfaceTintColor: AppColors.lightBackground,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.lightBackground,
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
          color: AppColors.lightBackground,
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
          ),
          child: ServiceGrid(services: services),
        ),
      ),
    );
  }
}
