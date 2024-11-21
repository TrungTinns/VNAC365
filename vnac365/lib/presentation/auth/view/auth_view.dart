import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vnac365/core/configs/assets/app_images.dart';
import 'package:vnac365/core/configs/theme/app_text.dart';
import 'package:vnac365/presentation/auth/controller/auth_controller.dart';
import 'package:vnac365/presentation/widgets/confirm_btn.dart';
import 'package:vnac365/presentation/widgets/iconic.dart';
import 'package:vnac365/presentation/widgets/textfield.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Img.background),
              fit: BoxFit.cover,
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
                    'Vui lòng đăng nhập để tiếp tục',
                    style: AppText.guideText,
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  AuthTextField(
                      controller: authController.phoneController,
                      node: authController.phoneFocusNode,
                      hintText: 'Số điện thoại',
                      icon: Icons.local_phone),
                  SizedBox(
                    height: 24.h,
                  ),
                  ConfirmBtn(onPressed: authController.signUp, text: 'Đăng ký'),
                  Spacer(),
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
