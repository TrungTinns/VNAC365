import 'package:vnac365/core/configs/assets/app_images.dart';
import 'package:vnac365/presentation/home/controller/home_controller.dart';
import 'package:vnac365/presentation/widgets/service_item.dart';

class Services {
  static List<ServiceItem> services(HomeController homeController) {
    return [
      ServiceItem(
        onTap: homeController.gotoActive,
        label: 'BAY',
        imagePath: Img.paperplane,
      ),
      ServiceItem(
        onTap: homeController.gotoQuiz,
        label: 'KIỂM TRA',
        imagePath: Img.folders,
      ),
      ServiceItem(
        onTap: () {},
        label: 'THỰC HÀNH',
        imagePath: Img.sandclock,
      ),
      ServiceItem(
        onTap: homeController.gotoHistory,
        label: 'BÀI THI ĐÃ LÀM',
        imagePath: Img.folder,
      ),
      ServiceItem(
        onTap: () {},
        label: 'ĐANG CHỜ',
        imagePath: Img.chronometer,
      ),
      ServiceItem(
        onTap: () {},
        label: 'HỖ TRỢ',
        imagePath: Img.teamsupport,
      ),
    ];
  }
}
