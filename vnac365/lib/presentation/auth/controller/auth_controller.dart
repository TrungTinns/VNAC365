import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnac365/routes/app_routes.dart';

class AuthController extends GetxController {
  final phoneController = TextEditingController();
  final phoneFocusNode = FocusNode();
  RxBool isSignUp = false.obs;

  Future<void> signUp() async {
    isSignUp.value = true;
    phoneFocusNode.unfocus();
    if (phoneController.text.isNotEmpty) {
      Get.toNamed(AppRoutes.active_otp);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    phoneController.dispose();
    phoneFocusNode.dispose();
    super.onClose();
  }
}
