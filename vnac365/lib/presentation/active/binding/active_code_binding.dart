import 'package:get/get.dart';
import 'package:vnac365/presentation/active/controller/active_code_controller.dart';

class ActiveCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActiveCodeController>(() => ActiveCodeController());
  }
}
