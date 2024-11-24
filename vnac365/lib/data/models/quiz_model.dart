class Question {
  final String text;
  final List<String> options;
  final List<int> correctAnswers; // Changed to support multiple correct answers
  final int maxSelections; // Maximum number of selections allowed
  final QuestionType type; // Added to distinguish between radio and checkbox questions

  Question({
    required this.text,
    required this.options,
    required this.correctAnswers,
    required this.type,
    this.maxSelections = 1,
  });
}

enum QuestionType {
  singleChoice,
  multipleChoice
}
