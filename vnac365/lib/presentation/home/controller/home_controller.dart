import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnac365/routes/app_routes.dart';

class HomeController extends GetxController {
  Future<void> gotoActive() async {
    Get.toNamed(AppRoutes.active);
  }

  Future<void> gotoQuiz() async {
    Get.toNamed(AppRoutes.quiz);
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
