import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vnac365/core/configs/theme/app_colors.dart';
import 'package:vnac365/core/configs/theme/app_text.dart';
import 'package:vnac365/presentation/quiz/controller/quiz_controller.dart';

class QuizScreen extends StatelessWidget {
  QuizScreen({super.key});
  final QuizController quizController = Get.find<QuizController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: 64.h),
              Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(child: _buildQuestion()),
                    Positioned(
                      top: -40,
                      child: (_buildTimer()),
                    ),
                  ]),
              SizedBox(height: 24.h),
              _buildOptions(),
              Spacer(),
              _buildNavigationButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Obx(() {
      final progress = (quizController.currentQuestionIndex.value + 1) /
          quizController.questions.length;
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 34.w,
            height: 34,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.info)),
            child: IconButton(
              icon: Icon(
                Icons.close,
                size: 14,
              ),
              onPressed: () => Get.back(),
            ),
          ),
          SizedBox(width: 19.w),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17), // Viền bo tròn
                border: Border.all(color: AppColors.info), // Viền ngoài
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Thanh Progress
                  Expanded(
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: AppColors.info,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.secondary),
                    ),
                  ),
                  SizedBox(width: 12), // Khoảng cách giữa Progress và Text
                  // Text hiển thị số câu
                  Text(
                      '${quizController.currentQuestionIndex.value + 1}/${quizController.questions.length}',
                      style: AppText.quizCount),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildTimer() {
    return Obx(() {
      final timeProgress = quizController.timeLeft.value / 1800;
      final timeString =
          quizController.formatTime(quizController.timeLeft.value);

      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.white,
                border: Border.all(width: 6, color: AppColors.white)),
            width: 80.w,
            height: 80,
            child: CircularProgressIndicator(
              value: timeProgress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              strokeWidth: 8,
            ),
          ),
          Text(timeString,
              style: AppText.pickText.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.welcome)),
        ],
      );
    });
  }

  Widget _buildQuestion() {
    return Obx(() {
      final question =
          quizController.questions[quizController.currentQuestionIndex.value];
      return Container(
        width: double.infinity,
        padding:
            EdgeInsets.only(left: 24.w, top: 56.h, right: 24.w, bottom: 23.h),
        decoration: BoxDecoration(
          color: AppColors.questBg,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          question.text,
          style: AppText.questText,
          textAlign: TextAlign.center,
        ),
      );
    });
  }

  Widget _buildOptions() {
    return Obx(() {
      final question =
          quizController.questions[quizController.currentQuestionIndex.value];
      final selectedAnswer = quizController.selectedAnswer?.value;

      return Column(
        children: List.generate(
          question.options.length,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _buildOptionItem(
                index, question.options[index], selectedAnswer),
          ),
        ),
      );
    });
  }

  Widget _buildOptionItem(int index, String optionText, int? selectedAnswer) {
    final isSelected = selectedAnswer == index;

    return GestureDetector(
      onTap: () => quizController.selectAnswer(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.questBg : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.transparent : AppColors.info,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                optionText,
                style: TextStyle(
                  color: isSelected ? AppColors.primary : AppColors.questColor,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.grey[300]!,
                  width: 2,
                ),
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Obx(() {
      final isAnswerSelected = quizController.selectedAnswer!.value != -1;
      final isFirstQuestion = quizController.currentQuestionIndex.value == 0;
      final isLastQuestion = quizController.currentQuestionIndex.value ==
          quizController.questions.length - 1;

      return Container(
        child: Row(
          children: [
            // Back Button - Ẩn ở câu hỏi đầu tiên
            if (!isFirstQuestion)
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 6.5.w),
                  height: 52.h,
                  child: TextButton(
                    onPressed: quizController.previousQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.info,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text('Câu trước', style: AppText.questText),
                  ),
                ),
              ),

            // Next/Finish Button
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: isFirstQuestion ? 0 : 6.5.w),
                height: 52.h,
                child: TextButton(
                  onPressed: isAnswerSelected
                      ? (isLastQuestion
                          ? quizController.finishQuiz
                          : quizController.nextQuestion)
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isLastQuestion ? Colors.green : AppColors.primary,
                    disabledBackgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    isLastQuestion ? 'Hoàn thành' : 'Câu tiếp theo',
                    style: AppText.btnText,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
