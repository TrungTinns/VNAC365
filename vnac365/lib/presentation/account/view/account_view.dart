import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vnac365/core/configs/assets/app_images.dart';
import 'package:vnac365/core/configs/theme/app_colors.dart';
import 'package:vnac365/core/configs/theme/app_text.dart';
import 'package:vnac365/presentation/account/controller/account_controller.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountController = Get.find<AccountController>();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        //this color must be equal to the WaterDropNavBar backgroundColor
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Img.backgroundOverturn),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: Text(
              'Tài khoản',
              style: AppText.btnText,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.white, // Màu viền
                            width: 3, // Độ dày viền
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(Img.logo),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: AppColors.white,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          side: const BorderSide(color: Colors.white, width: 3),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  'Nguyễn Xuân',
                  style: AppText.userName,
                ),
                SizedBox(height: 10.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                      color: AppColors.questBg,
                      borderRadius: BorderRadius.circular(50.r)),
                  child: Text(
                    '0981254560',
                    style: AppText.correctAnswer,
                  ),
                ),
                SizedBox(height: 40.h),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(Icons.info, color: AppColors.secondary),
                        title: Text('Version: 2.0.0 (build 23)'),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.calendar_month,
                            color: AppColors.secondary),
                        title: Text('Build date: 25/08/2018'),
                      ),
                      Divider(),
                      ListTile(
                        leading:
                            Icon(Icons.settings, color: AppColors.secondary),
                        title: Text('2018 All Rights Reserved.'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                ElevatedButton(
                  onPressed: accountController.signOut,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 56.h),
                    foregroundColor: AppColors.incorrect,
                    surfaceTintColor: AppColors.incorrectBg,
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 36.w, vertical: 16.h),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        color: AppColors.incorrect,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        'Đăng xuất',
                        style: AppText.incorrectAnswer,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
