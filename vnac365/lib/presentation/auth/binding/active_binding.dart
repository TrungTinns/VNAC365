import 'package:get/get.dart';
import 'package:vnac365/presentation/auth/controller/active_controller.dart';

class ActiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActiveController>(() => ActiveController());
  }
}
