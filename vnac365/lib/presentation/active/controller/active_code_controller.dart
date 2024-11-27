import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnac365/routes/app_routes.dart';

class ActiveCodeController extends GetxController {
  final codeController = TextEditingController();
  final codeFocusNode = FocusNode();
  RxBool isActive = false.obs;

  Future<void> gotoQuiz() async {
    isActive.value = true;
    codeFocusNode.unfocus();
    if (codeController.text.isNotEmpty) {
      Get.toNamed(AppRoutes.quiz);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    codeController.dispose();
    codeFocusNode.dispose();
    super.onClose();
  }
}
