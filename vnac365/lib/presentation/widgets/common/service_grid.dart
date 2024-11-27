import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:vnac365/core/configs/assets/app_images.dart';
import 'package:vnac365/presentation/widgets/common/service_item.dart';

class ServiceGrid extends StatelessWidget {
  final List<ServiceItem> services;

  const ServiceGrid({
    Key? key,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                Img.banner,
                height: 110,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
          ...List.generate(
            services.length,
            (index) => GridAnimatorWidget(
              child: ServiceItem(
                imagePath: services[index].imagePath,
                count: services[index].count,
                label: services[index].label,
                onTap: services[index].onTap,
              ),
            ),
          ),
        ]);
  }
}
