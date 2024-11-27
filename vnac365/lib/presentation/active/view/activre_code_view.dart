import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vnac365/core/configs/assets/app_images.dart';
import 'package:vnac365/core/configs/theme/app_colors.dart';
import 'package:vnac365/core/configs/theme/app_text.dart';
import 'package:vnac365/presentation/active/controller/active_code_controller.dart';
import 'package:vnac365/presentation/auth/controller/active_controller.dart';
import 'package:vnac365/presentation/widgets/common/confirm_btn.dart';
import 'package:vnac365/presentation/widgets/common/iconic.dart';
import 'package:vnac365/presentation/widgets/common/textfield.dart';

class ActiveCodeScreen extends StatelessWidget {
  const ActiveCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activeController = Get.find<ActiveCodeController>();

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            'Take exam by code',
            style: AppText.f16w800,
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: AppColors.lightBackground,
        ),
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
                  SizedBox(
                    height: 145,
                  ),
                  Text(
                    'VNAC 365',
                    style: AppText.iconicText,
                  ),
                  Text(
                    'Enter your exam code',
                    style: AppText.guideText,
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  AuthTextField(
                      controller: activeController.codeController,
                      node: activeController.codeFocusNode,
                      hintText: 'Code',
                      icon: Icons.key_rounded),
                  SizedBox(
                    height: 24.h,
                  ),
                  ConfirmBtn(
                      onPressed: activeController.gotoQuiz, text: 'ACtive'),
                  const Spacer(),
                ]),
          ),
        ));
  }
}
