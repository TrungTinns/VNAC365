import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vnac365/core/configs/assets/app_images.dart';
import 'package:vnac365/core/configs/theme/app_text.dart';
import 'package:vnac365/presentation/auth/controller/active_controller.dart';
import 'package:vnac365/presentation/widgets/confirm_btn.dart';
import 'package:vnac365/presentation/widgets/iconic.dart';
import 'package:vnac365/presentation/widgets/textfield.dart';

class ActiveScreen extends StatelessWidget {
  const ActiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activeController = Get.find<ActiveController>();

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Img.background),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 57.h),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  iconic(),
                  Text(
                    'Vui lòng nhập mã OTP để vào hệ thống',
                    style: AppText.guideText,
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  AuthTextField(
                      controller: activeController.codeController,
                      node: activeController.codeFocusNode,
                      hintText: 'Nhập mã',
                      icon: Icons.local_phone),
                  SizedBox(
                    height: 24.h,
                  ),
                  ConfirmBtn(
                      onPressed: activeController.active, text: 'ACtive'),
                  const Spacer(),
                  Center(
                    child: Text(
                      'By Nam Phương Technology',
                      style: AppText.info,
                    ),
                  ),
                ]),
          ),
        ));
  }
}
