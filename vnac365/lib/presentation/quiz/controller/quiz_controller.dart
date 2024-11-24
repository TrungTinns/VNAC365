import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnac365/data/models/quiz_model.dart';
import 'package:vnac365/routes/app_routes.dart';

class QuizController extends GetxController {
  RxInt currentQuestionIndex = 0.obs;
  RxInt score = 0.obs;
  RxInt timeLeft = 1800.obs;
  Timer? timer;

  // Changed to support multiple selections per question
  final RxMap<int, RxList<int>> userAnswers = <int, RxList<int>>{}.obs;

  RxBool isReviewMode = false.obs;

  final questions = [
    Question(
      text: 'LCML is the special meal which contains',
      options: [
        'A low gluten',
        'A low fat',
        'A low calories',
      ],
      correctAnswers: [1],
      type: QuestionType.singleChoice,
    ),
    Question(
      text:
          'Which of the following are characteristics of a balanced diet? (Select 2)',
      options: [
        'Contains all essential nutrients',
        'High in processed foods',
        'Includes variety of food groups',
        'Excludes all fats',
      ],
      correctAnswers: [0, 2],
      type: QuestionType.multipleChoice,
      maxSelections: 2,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    initializeQuiz();
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
    resetQuiz();
  }

  void initializeQuiz() {
    // Reset timer
    timeLeft.value = 1800;
    // Initialize empty selection lists for each question
    for (int i = 0; i < questions.length; i++) {
      userAnswers[i] = RxList<int>([]);
    }
    // Start timer only if not in review mode
    if (!isReviewMode.value) {
      startTimer();
    }
  }

  void resetQuiz() {
    currentQuestionIndex.value = 0;
    score.value = 0;
    timeLeft.value = 1800;
    isReviewMode.value = false; // Reset review mode
    userAnswers.clear();
    for (int i = 0; i < questions.length; i++) {
      userAnswers[i] = RxList<int>([]);
    }
    timer?.cancel();
    startTimer();
    Get.toNamed(AppRoutes.bottomNavBar);
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft.value > 0) {
        timeLeft.value--;
      } else {
        endQuiz();
      }
    });
  }

  void startReview() {
    isReviewMode.value = true;
    currentQuestionIndex.value = 0;
    timeLeft.value = 0;
    Get.back(); // Đóng dialog
  }

  void finishQuiz() {
    timer?.cancel();
    // Nếu đang trong chế độ review thì chỉ reset và navigate
    if (isReviewMode.value) {
      resetQuiz();
      Get.toNamed(AppRoutes.bottomNavBar);
      return;
    }

    // Tính điểm chỉ khi không ở chế độ review
    score.value = 0;
    for (int i = 0; i < questions.length; i++) {
      var question = questions[i];
      var userAnswer = userAnswers[i] ?? RxList<int>([]);

      if (question.type == QuestionType.singleChoice) {
        if (userAnswer.isNotEmpty &&
            question.correctAnswers.contains(userAnswer[0])) {
          score.value++;
        }
      } else {
        if (userAnswer.length == question.correctAnswers.length &&
            userAnswer
                .toSet()
                .difference(question.correctAnswers.toSet())
                .isEmpty) {
          score.value++;
        }
      }
    }

    Get.defaultDialog(
      title: 'Kết thúc!',
      middleText: 'Bạn đã đạt được ${score.value}/${questions.length} điểm',
      confirm: ElevatedButton(
        onPressed: () => startReview(),
        child: Text('Xem lại bài làm'),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          resetQuiz();
          Get.toNamed(AppRoutes.bottomNavBar);
        },
        child: Text('Kết thúc'),
      ),
    );
  }

  void endQuiz() {
    timer?.cancel();
    Get.defaultDialog(
      title: 'Hết giờ!',
      middleText: 'Bạn đã đạt được ${score.value}/${questions.length} điểm',
      barrierDismissible: false,
      confirm: ElevatedButton(
        onPressed: () {
          resetQuiz();
          Get.toNamed(AppRoutes.bottomNavBar);
        },
        child: Text('OK'),
      ),
    );
  }

  void previousQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value--;
    }
  }

  void nextQuestion() {
    var currentAnswers =
        userAnswers[currentQuestionIndex.value] ?? RxList<int>([]);
    if (currentAnswers.isNotEmpty) {
      if (currentQuestionIndex.value < questions.length - 1) {
        currentQuestionIndex.value++;
      }
    }
  }

  bool isCurrentQuestionAnswered() {
    var currentAnswers =
        userAnswers[currentQuestionIndex.value] ?? RxList<int>([]);
    return currentAnswers.isNotEmpty;
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void toggleAnswer(int questionIndex, int answerIndex) {
    if (!userAnswers.containsKey(questionIndex)) {
      userAnswers[questionIndex] = RxList<int>([]);
    }

    var currentAnswers = userAnswers[questionIndex]!;
    var question = questions[questionIndex];

    if (question.type == QuestionType.singleChoice) {
      currentAnswers.assignAll([answerIndex]);
    } else {
      if (currentAnswers.contains(answerIndex)) {
        currentAnswers.remove(answerIndex);
      } else if (currentAnswers.length < question.maxSelections) {
        currentAnswers.add(answerIndex);
      }
    }
  }

  bool isAnswerSelected(int questionIndex, int answerIndex) {
    return userAnswers[questionIndex]?.contains(answerIndex) ?? false;
  }

  bool isAnswerCorrect(int questionIndex, int answerIndex) {
    return questions[questionIndex].correctAnswers.contains(answerIndex);
  }
}
