import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:transformable_list_view/transformable_list_view.dart';
import 'package:vnac365/core/configs/assets/app_images.dart';
import 'package:vnac365/core/configs/theme/app_colors.dart';
import 'package:vnac365/core/configs/theme/app_text.dart';
import 'package:vnac365/presentation/history/controller/history_controller.dart';
import 'package:vnac365/routes/app_routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool showInitialAnimation = true;

  @override
  void initState() {
    super.initState();
    // Sau 2 giây (thời gian cho animation_list chạy xong) sẽ tắt animation ban đầu
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (mounted) {
        setState(() {
          showInitialAnimation = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoryController>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Img.backgroundOverturn),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Lịch sử',
            style: AppText.btnText,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColors.white,
            onPressed: () => Get.toNamed(AppRoutes.bottomNavBar),
          ),
        ),
        body: Container(
          // padding: EdgeInsets.symmetric(horizontal: 14.w),
          margin: EdgeInsets.symmetric(vertical: 33.h),
          child: Column(
            children: [
              SizedBox(height: 13.h),
              Expanded(
                child: Obx(() {
                  // Sử dụng animation_list cho hiệu ứng ban đầu
                  if (showInitialAnimation) {
                    return AnimationList(
                      duration: 1500,
                      reBounceDepth: 30,
                      children:
                          controller.historyItems.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return _buildHistoryItem(
                          index + 1,
                          item['title'] as String,
                          item['dateTime'] as String,
                          item['score'] as int,
                          item['duration'] as String,
                        );
                      }).toList(),
                    );
                  }
                  // Sau đó chuyển sang TransformableListView cho hiệu ứng scroll
                  else {
                    return TransformableListView.builder(
                      padding: EdgeInsets.zero,
                      getTransformMatrix: _scaleDownEffect,
                      itemCount: controller.historyItems.length,
                      itemBuilder: (context, index) {
                        final item = controller.historyItems[index];
                        return _buildHistoryItem(
                          index + 1,
                          item['title'] as String,
                          item['dateTime'] as String,
                          item['score'] as int,
                          item['duration'] as String,
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Matrix4 _scaleDownEffect(TransformableListItem item) {
    const endScaleBound =
        0.8; // Tỉ lệ scale cuối cùng khi item rời xa trung tâm.
    final animationProgress = item.visibleExtent / item.size.height;

    final scale = endScaleBound + ((1 - endScaleBound) * animationProgress);

    return Matrix4.identity()
      ..translate(item.size.width / 2)
      ..scale(scale)
      ..translate(-item.size.width / 2);
  }

  Widget _buildHistoryItem(
      int index, String title, String dateTime, int score, String duration) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.certificate,
                color: AppColors.secondary,
                size: 40,
              ),
              Text(
                "$index", // Thay 'Your Text Here' bằng văn bản bạn muốn hiển thị
                style: AppText.btnText,
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppText.service),
                const SizedBox(height: 6),
                Text(dateTime, style: AppText.dateHistory),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("$score",
                  style: AppText.correctAnswer
                      .copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 6),
              Text("Thời gian: $duration",
                  style: AppText.dateHistory
                      .copyWith(color: AppColors.insideColor)),
            ],
          ),
        ],
      ),
    );
  }
}
