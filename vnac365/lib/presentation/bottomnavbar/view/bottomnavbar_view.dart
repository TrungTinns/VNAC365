import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vnac365/core/configs/theme/app_colors.dart';
import 'package:vnac365/presentation/account/controller/account_controller.dart';
import 'package:vnac365/presentation/account/view/account_view.dart';
import 'package:vnac365/presentation/home/controller/home_controller.dart';
import 'package:vnac365/presentation/home/view/home_view.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;

  final List<Widget?> _pages = [
    const HomeScreen(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountController>(() => AccountController());
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        //this color must be equal to the WaterDropNavBar backgroundColor
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
          backgroundColor: AppColors.lightBackground,
          body: _pages[_selectedIndex], // Hiển thị trang tương ứng
          bottomNavigationBar: WaterDropNavBar(
            bottomPadding: 16.h,
            inactiveIconColor: AppColors.hintColor,
            waterDropColor: AppColors.primary,
            backgroundColor: AppColors.lightBackground,
            onItemSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedIndex: _selectedIndex,
            barItems: <BarItem>[
              BarItem(
                filledIcon: Icons.home_rounded,
                outlinedIcon: Icons.home_rounded,
              ),
              BarItem(
                filledIcon: Icons.person_rounded,
                outlinedIcon: Icons.person_rounded,
              ),
            ],
          )),
    );
  }
}
