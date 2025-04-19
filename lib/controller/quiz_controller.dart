/*
  ---------------------------------------
  Project: Stumped Game Mobile Application
  Date: April 11, 2024
  Author: Ameer from Pakistan
  ---------------------------------------
  Description: quiz controller logic code
*/
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/quiz_question_model.dart';
import '../view/quiz/result_screen.dart';

class QuizController extends GetxController {
  final SharedPreferences sharedPreferences;
  QuizController({required this.sharedPreferences});

  RxInt currentQuestionIndex = 0.obs;
  RxInt score = 0.obs;
  RxList<bool> questionAnswered = <bool>[].obs;
  RxInt selectedAnswerIndex = (-1).obs;
  RxList<int> selectedAnswerIndices = <int>[].obs; // Store all selected answers
  RxBool isAnswered = false.obs;

  // List of quiz questions
  final List<QuizQuestion> questions = [
    QuizQuestion(
      options: ["Sydney Barnes", "Imran Khan", "Don Bradman", "Sir Jack Hobbs"],
      correctAnswerIndex: 0,
      imagePath: "assets/images/quiz1.png",
    ),
    QuizQuestion(
      options: [ "Mahendra Singh Dhoni", "Muttiah Muralitharan", "Wasim Akram", "Virat Kohli",],
      correctAnswerIndex: 0,
      imagePath: "assets/images/quiz2.png",
    ),
    QuizQuestion(
      options: [ "Wally Hammond", "Kapil Dev", "Virender Sehwag", "Rahul Dravid"],
      correctAnswerIndex: 0,
      imagePath: "assets/images/quiz3.png",
    ),
    QuizQuestion(
      options: ["Virender Sehwag", "Sunil Gavaskar", "Sir Viv Richards", "Sachin Tendulkar"],
      correctAnswerIndex: 2,
      imagePath: "assets/images/quiz4.png",
    ),
    QuizQuestion(
      options: ["Rahul Dravid", "Virender Sehwag", "Sachin Tendulkar", "James Anderson"],
      correctAnswerIndex: 3,
      imagePath: "assets/images/quiz5.png",
    ),
    QuizQuestion(
      options: ["Virender Sehwag", "Sunil Gavaskar", "Muttiah Muralitharan", "Sachin Tendulkar"],
      correctAnswerIndex: 2,
      imagePath: "assets/images/quiz6.png",
    ),
    QuizQuestion(
      options: ["Wasim Akram", "Sachin Tendulkar", "Sunil Gavaskar", "Virat Kohli", ],
      correctAnswerIndex: 0,
      imagePath: "assets/images/quiz7.png",
    ),
    QuizQuestion(
      options: ["Virender Sehwag", "Sachin Tendulkar", "Anil Kumble", "Virat Kohli", ],
      correctAnswerIndex: 1,
      imagePath: "assets/images/quiz8.png",
    ),
    QuizQuestion(
      options: ["Virender Sehwag", "Brian Lara", "Anil Kumble", "Virat Kohli", ],
      correctAnswerIndex: 1,
      imagePath: "assets/images/quiz9.png",
    ),
    QuizQuestion(
      options: ["Virender Sehwag", "Shubman Gill", "Anil Kumble",  "Brett Lee", ],
      correctAnswerIndex: 3,
      imagePath: "assets/images/quiz10.png",
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    questionAnswered.value = List.generate(questions.length, (index) => false);
    selectedAnswerIndices.value = List.generate(questions.length, (index) => -1);
  }

  // Select an answer and move to next question automatically
  void selectAnswerAndContinue(int selectedIndex) {
    if (!questionAnswered[currentQuestionIndex.value]) {
      selectedAnswerIndex.value = selectedIndex;
      selectedAnswerIndices[currentQuestionIndex.value] = selectedIndex;
      isAnswered.value = true; // Mark question as answered

      if (selectedIndex == questions[currentQuestionIndex.value].correctAnswerIndex) {
        score.value++;
      }

      questionAnswered[currentQuestionIndex.value] = true;

      // Automatically move to next question after a short delay
      Future.delayed(const Duration(milliseconds: 750), () {
        if (currentQuestionIndex.value < questions.length - 1) {
          currentQuestionIndex.value++;
          selectedAnswerIndex.value = -1;
          isAnswered.value = false;
        } else {
          // All questions answered, show results
          Get.to(() => ResultScreen());
        }
        update();
      });

      update();
    }
  }

  // Select an answer but don't move to next question automatically
  void selectAnswer(int selectedIndex) {
    if (!questionAnswered[currentQuestionIndex.value]) {
      selectedAnswerIndex.value = selectedIndex;
      selectedAnswerIndices[currentQuestionIndex.value] = selectedIndex;
      isAnswered.value = true; // Mark question as answered

      if (selectedIndex == questions[currentQuestionIndex.value].correctAnswerIndex) {
        score.value++;
      }

      questionAnswered[currentQuestionIndex.value] = true;
      update();
    }
  }

  // Navigate to next question or results when the Next button is pressed
  void goToNextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;

      // Show the state of the current question
      selectedAnswerIndex.value = selectedAnswerIndices[currentQuestionIndex.value];
      isAnswered.value = questionAnswered[currentQuestionIndex.value];
    } else {
      // All questions answered, show results
      Get.to(() => ResultScreen());
    }
    update();
  }

  // Navigate to a specific question (for grid navigation)
  void navigateToQuestion(int index) {
    currentQuestionIndex.value = index;

    // Show the state of the current question
    selectedAnswerIndex.value = selectedAnswerIndices[index];
    isAnswered.value = questionAnswered[index];
    update();
  }

  void resetQuiz() {
    currentQuestionIndex.value = 0;
    score.value = 0;
    selectedAnswerIndex.value = -1;
    isAnswered.value = false;
    questionAnswered.value = List.generate(questions.length, (index) => false);
    selectedAnswerIndices.value = List.generate(questions.length, (index) => -1);
  }
}