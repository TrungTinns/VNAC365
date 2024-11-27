import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnac365/routes/app_routes.dart';

class HomeController extends GetxController {
  Future<void> gotoQuiz() async {
    Get.toNamed(AppRoutes.active_code);
  }

  Future<void> gotoPractice() async {
    Get.toNamed(AppRoutes.quiz);
  }

  Future<void> gotoHistory() async {
    Get.toNamed(AppRoutes.history);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
