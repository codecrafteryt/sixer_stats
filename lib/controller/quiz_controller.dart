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
    RxBool isAnswered = false.obs;

    // List of quiz questions
    final List<QuizQuestion> questions = [
      QuizQuestion(
        question: "Who is known as the 'God of Cricket' in India?",
        options: ["Brian Lara", "Virat Kohli", "Kapil Dev", "Sachin Tendulkar"],
        correctAnswerIndex: 3,
        imagePath: "assets/images/don.png",
      ),
      QuizQuestion(
        question: "Which Indian cricketer has the highest individual score in Test cricket in 2011-2024?",
        options: [ "kapil dev", "Virender Sehwag", "Virat Kohli", "MS Dhoni",],
        correctAnswerIndex: 2,
        imagePath: "assets/images/quiz2.png",
      ),
      QuizQuestion(
        question: "Who captained India to its first-ever ICC Cricket World Cup victory in 1983?",
        options: [ "Anil Kumble", "Kapil Dev", "Virender Sehwag", "Rahul Dravid"],
        correctAnswerIndex: 1,
        imagePath: "assets/images/quiz3.png",
      ),
      QuizQuestion(
        question: "Who holds the record for the most centuries in One Day Internationals for India?",
        options: ["Virender Sehwag", "Sunil Gavaskar", "Virat Kohli", "Sachin Tendulkar"],
        correctAnswerIndex: 3,
        imagePath: "assets/images/quiz4.png",
      ),
      QuizQuestion(
        question: "Which Indian cricketer has won the most number of Man of the Match awards in ICC Cricket World Cup history?",
        options: ["Rahul Dravid", "Virender Sehwag", "Sachin Tendulkar", "MS Dhoni"],
        correctAnswerIndex: 2,
        imagePath: "assets/images/quiz5.png",
      ),
      QuizQuestion(
        question: "Who was the captain of the Indian cricket team in Test matches in 2017?",
        options: ["Virender Sehwag", "Sunil Gavaskar", "Virat Kohli", "Sachin Tendulkar"],
        correctAnswerIndex: 2,
        imagePath: "assets/images/quiz6.png",
      ),QuizQuestion(
        question: "Who was the first Indian cricketer to score a double century in One Day Internationals?",
        options: ["Virender Sehwag", "Sachin Tendulkar", "Sunil Gavaskar", "Virat Kohli", ],
        correctAnswerIndex: 1,
        imagePath: "assets/images/quiz6.png",
      ),
      QuizQuestion(
        question: "Which Indian cricketer has the highest individual score in Test cricket in 2011-2024?",
        options: ["Virender Sehwag", "Sachin Tendulkar", "Anil Kumble", "Virat Kohli", ],
        correctAnswerIndex: 4,
        imagePath: "assets/images/quiz7.png",
      ),
      QuizQuestion(
        question: "Which Indian bowler has taken the most wickets in Test cricket?",
        options: ["Virender Sehwag", "Anil Kumble", "Anil Kumble", "Virat Kohli", ],
        correctAnswerIndex: 1,
        imagePath: "assets/images/quiz7.png",
      ),
      QuizQuestion(
        question: "Who holds the record for the highest individual score in Twenty20 Internationals for India in 2024?",
        options: ["Virender Sehwag", "Shubman Gill", "Anil Kumble", "Virat Kohli", ],
        correctAnswerIndex: 1,
        imagePath: "assets/images/quiz8.png",
      ),

    ];

    @override
    void onInit() {
      super.onInit();
      questionAnswered.value = List.generate(questions.length, (index) => false);
    }

    // Select an answer but don't move to next question automatically
    void selectAnswer(int selectedIndex) {
      if (!questionAnswered[currentQuestionIndex.value]) {
        selectedAnswerIndex.value = selectedIndex;
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
        selectedAnswerIndex.value = -1;
        isAnswered.value = false;
      } else {
        // All questions answered, show results
        Get.to(() => ResultScreen());
      }
      update();
    }

    // Original method (not used anymore but kept for reference)
    void answerQuestion(int selectedIndex) {
      if (!questionAnswered[currentQuestionIndex.value]) {
        selectedAnswerIndex.value = selectedIndex;
        isAnswered.value = true;
        if (selectedIndex == questions[currentQuestionIndex.value].correctAnswerIndex) {
          score.value++;
        }
        questionAnswered[currentQuestionIndex.value] = true;
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (currentQuestionIndex.value < questions.length - 1) {
            currentQuestionIndex.value++;
            selectedAnswerIndex.value = -1;
            isAnswered.value = false;
          } else {
            Get.to(() => ResultScreen());
          }
        });
        update();
      }
    }

    void resetQuiz() {
      currentQuestionIndex.value = 0;
      score.value = 0;
      selectedAnswerIndex.value = -1;
      isAnswered.value = false;
      questionAnswered.value = List.generate(questions.length, (index) => false);
    }
  }