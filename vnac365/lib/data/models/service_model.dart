import 'package:vnac365/core/configs/assets/app_images.dart';
import 'package:vnac365/presentation/home/controller/home_controller.dart';
import 'package:vnac365/presentation/widgets/common/service_item.dart';

class Services {
  static List<ServiceItem> services(HomeController homeController) {
    return [
      ServiceItem(
        onTap: homeController.gotoQuiz,
        label: 'KIỂM TRA',
        imagePath: Img.folders,
        count: 122,
      ),
      ServiceItem(
        onTap: homeController.gotoPractice,
        label: 'THỰC HÀNH',
        imagePath: Img.sandclock,
        count: 113,
      ),
      ServiceItem(
        onTap: homeController.gotoHistory,
        label: 'BÀI THI ĐÃ LÀM',
        imagePath: Img.folder,
        count: 123,
      ),
    ];
  }
}
