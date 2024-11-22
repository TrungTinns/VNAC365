import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs; // Reactive state
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController = PageController(initialPage: selectedIndex.value);
    });
  }

  void onTabSelected(int index) {
    selectedIndex.value = index;
    if (pageController.hasClients) {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutQuad);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
