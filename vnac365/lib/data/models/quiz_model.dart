class Question {
  final String text;
  final List<String> options;
  final int correctAnswer;

  Question({
    required this.text,
    required this.options,
    required this.correctAnswer,
  });
}
// class Question {
//   final String text;
//   final List<String> options;
//   final List<int>
//       correctAnswers; // Giới hạn số đáp án mà người dùng có thể chọn

//   Question({
//     required this.text,
//     required this.options,
//     required this.correctAnswers,
//   });
// }

// class Option {
//   final String text;
//   final bool isCorrect;

//   Option({
//     required this.text,
//     required this.isCorrect,
//   });
// }
