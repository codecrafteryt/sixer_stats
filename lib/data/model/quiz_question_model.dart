
class QuizQuestion {
  final String? question;
  final List<String> options;
  final int correctAnswerIndex;
  final String? imagePath;

  QuizQuestion({
    this.question,
    required this.options,
    required this.correctAnswerIndex,
    this.imagePath,
  });
}