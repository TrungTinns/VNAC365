import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnac365/data/models/quiz_model.dart';
import 'package:vnac365/routes/app_routes.dart';

class QuizController extends GetxController {
  RxInt currentQuestionIndex = 0.obs;
  RxInt score = 0.obs;
  RxInt? selectedAnswer = RxInt(-1);
  RxInt timeLeft = 1800.obs; // 30 minutes in seconds
  Timer? timer;
  final RxMap<int, int> userAnswers = <int, int>{}.obs;

  final questions = [
    Question(
      text: 'LCML is the special meal which contains',
      options: [
        'A low gluten',
        'A low fat',
        'A low calories',
      ],
      correctAnswer: 1,
    ),
    Question(
      text:
          'LCML is the special ádhaskdjojsdhfkagsdkasgkdgaskdgaksdgkasgdkasgdjasdhmeal which contains',
      options: [
        'A low gluten',
        'A low fat',
        'A low calories',
      ],
      correctAnswer: 1,
    ),
    Question(
      text: 'LCML is the special meal which contains',
      options: [
        'A low gluten',
        'A low fat',
        'A low calories',
      ],
      correctAnswer: 1,
    ),
    Question(
      text: 'LCML is the special meal which contains',
      options: [
        'A low gluten',
        'A low fat',
        'A low calories',
      ],
      correctAnswer: 1,
    ),
    Question(
      text: 'LCML is the special meal which contains',
      options: [
        'A low gluten',
        'A low fat',
        'A low calories',
      ],
      correctAnswer: 1,
    ),
    Question(
      text: 'LCML is the special meal which contains',
      options: [
        'A low gluten',
        'A low fat',
        'A low calories',
      ],
      correctAnswer: 1,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft.value > 0) {
        timeLeft.value--;
      } else {
        endQuiz();
      }
    });
  }

  void endQuiz() {
    timer?.cancel();
    Get.defaultDialog(
      title: 'Hết giờ!',
      middleText: 'Bạn đã đạt được ${score.value}/${questions.length} điểm',
      barrierDismissible: false,
      confirm: ElevatedButton(
        onPressed: () {
          // Get.back();
          resetQuiz();
          Get.toNamed(AppRoutes.bottomNavBar);
        },
        child: Text('OK'),
      ),
    );
  }

  void resetQuiz() {
    currentQuestionIndex.value = 0;
    score.value = 0;
    selectedAnswer?.value = -1;
    timeLeft.value = 1800;
    startTimer();
    userAnswers.clear();
  }

  void selectAnswer(int value) {
    selectedAnswer?.value = value;
  }

  void previousQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value--;
      // Khôi phục câu trả lời đã chọn trước đó (nếu có)
      selectedAnswer!.value = userAnswers[currentQuestionIndex.value] ?? -1;
    }
  }

  void nextQuestion() {
    if (selectedAnswer!.value != -1) {
      // Lưu câu trả lời hiện tại
      userAnswers[currentQuestionIndex.value] = selectedAnswer!.value;

      if (currentQuestionIndex.value < questions.length - 1) {
        currentQuestionIndex.value++;
        // Khôi phục câu trả lời đã chọn trước đó (nếu có)
        selectedAnswer!.value = userAnswers[currentQuestionIndex.value] ?? -1;
      }
    }
  }

  void finishQuiz() {
    if (selectedAnswer!.value != -1) {
      userAnswers[currentQuestionIndex.value] = selectedAnswer!.value;

      // Tính điểm dựa trên tất cả câu trả lời
      score.value = 0;
      userAnswers.forEach((index, answer) {
        if (answer == questions[index].correctAnswer) {
          score.value++;
        }
      });

      endQuiz();
    }
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
