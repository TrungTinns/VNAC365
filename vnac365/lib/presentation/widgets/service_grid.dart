import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:vnac365/presentation/widgets/service_item.dart';

class ServiceGrid extends StatelessWidget {
  final List<ServiceItem> services;

  const ServiceGrid({
    Key? key,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 10.w),
      crossAxisCount: 2,
      mainAxisSpacing: 32.h,
      crossAxisSpacing: 16.w,
      children: List.generate(
        services.length,
        (index) => GridAnimatorWidget(
          child: ServiceItem(
            imagePath: services[index].imagePath,
            label: services[index].label,
            onTap: services[index].onTap,
          ),
        ),
      ),
    );
  }
}
