import 'package:get/get.dart';
import 'package:vnac365/presentation/account/controller/account_controller.dart';
import 'package:vnac365/presentation/home/controller/home_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
