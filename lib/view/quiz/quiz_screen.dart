  /*
            ---------------------------------------
            Project: Stumped Game Mobile Application
            Date: April 11, 2024
            Author: Ameer from Pakistan
            ---------------------------------------
            Description: Quiz Screen
          */
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get_core/src/get_main.dart' show Get;
  import 'package:get/get_instance/get_instance.dart';
  import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sixer_stats/utils/extensions/extentions.dart';
import 'package:sixer_stats/utils/values/my_color.dart';
import 'package:sixer_stats/utils/values/style.dart';
import 'package:sixer_stats/view/widgets/custom_appbar.dart';

  class QuizScreen extends StatelessWidget {
    //final QuizController quizController = Get.find();
    QuizScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: MyColors.backGround,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/blur.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                CustomAppBar(
                  title: "QUIZ:",
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        20.sbh,
                        Padding(
                          padding: EdgeInsets.all(16.0.w),
                          child: Obx(() => Text(
                            '',
                            //quizController.questions[quizController.currentQuestionIndex.value].question,
                            textAlign: TextAlign.center,
                            style: kSize14DarkW400Text.copyWith(
                              fontSize: 48.sp,
                              color: MyColors.white,
                            ),
                          )),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(16.0),
                        //   child: Obx(() => ListView.separated(
                        //     shrinkWrap: true,
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: quizController.questions[quizController.currentQuestionIndex.value].options.length,
                        //     separatorBuilder: (context, index) => SizedBox(height: 16),
                        //     itemBuilder: (context, index) => _buildAnswerOption(index, quizController),
                        //   )),
                        // ),
                      ],
                    ),
                  ),
                ),

                // Next button at the bottom
                // Padding(
                //   padding: EdgeInsets.all(16.0),
                //   child: Obx(() => _buildNextButton(quizController)),
                // ),
              ],
            ),
          ),
        ),
      );
    }

    // Widget _buildAnswerOption(int index, QuizController controller) {
    //   return Obx(() {
    //     bool isSelected = controller.selectedAnswerIndex.value == index;
    //     bool isCorrect = controller.questions[controller.currentQuestionIndex.value].correctAnswerIndex == index;
    //
    //     // Apply background color based on selection and correctness
    //     Color backgroundColor;
    //     if (controller.isAnswered.value) {
    //       if (isSelected) {
    //         // Selected answer - green if correct, red if incorrect
    //         backgroundColor = isCorrect
    //             ? const Color.fromRGBO(93, 185, 102, 0.52) // Green for correct
    //             : const Color.fromRGBO(255, 99, 71, 0.52);  // Red for incorrect
    //       } else if (isCorrect) {
    //         // Show correct answer in green when question is answered
    //         backgroundColor = const Color.fromRGBO(93, 185, 102, 0.52); // Green for correct
    //       } else {
    //         // Default for unselected options
    //         backgroundColor = const Color.fromRGBO(255, 255, 255, 0.52);
    //       }
    //     } else {
    //       // Default before answering
    //       backgroundColor = const Color.fromRGBO(255, 255, 255, 0.52);
    //     }
    //
    //     // // Apply color logic to border
    //     // Color borderColor = isSelected
    //     //     ? (isCorrect ? Colors.green : Color.fromRGBO(242, 126, 58, 1))
    //     //     : (controller.isAnswered.value && isCorrect ? Colors.green : const Color.fromRGBO(65, 85, 75, 1));
    //
    //     return GestureDetector(
    //       onTap: () {
    //         if (!controller.isAnswered.value) {
    //           controller.selectAnswer(index); // Modified to just select answer, not automatically move to next question
    //         }
    //       },
    //       child: Container(
    //         height: 83.h,
    //         width: double.infinity,
    //         decoration: BoxDecoration(
    //           color: backgroundColor,
    //           borderRadius: BorderRadius.circular(6.r),
    //           border: Border.all(
    //             color: const Color.fromRGBO(65, 85, 75, 1),
    //             width: 9.w,
    //           ),
    //         ),
    //         child: Center(
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text(
    //               controller.questions[controller.currentQuestionIndex.value].options[index],
    //               textAlign: TextAlign.center,
    //               style: kSize14DarkW400Text.copyWith(
    //                 fontSize: 32.sp,
    //                 color: MyColors.white,
    //                 shadows: [
    //                   Shadow(
    //                     offset: Offset(3.w, 3.h),
    //                     blurRadius: 3.r,
    //                     color: const Color.fromRGBO(51, 57, 20, 1),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     );
    //   });
    // }
    //
    //
    // Widget _buildNextButton(QuizController controller) {
    //   return GestureDetector(
    //     onTap: controller.isAnswered.value
    //         ? () => controller.goToNextQuestion()
    //         : null, // Button is disabled until an answer is selected
    //     child: Container(
    //       width: 232.w, // Custom width from CustomButton
    //       height: 108.h, // Custom height from CustomButton
    //       decoration: BoxDecoration(
    //         color: controller.isAnswered.value
    //             ? Color.fromRGBO(65, 85, 75, 1)
    //             : Colors.grey.withOpacity(0.6),
    //         borderRadius: BorderRadius.circular(60.r), // Custom border radius
    //         border: Border.all(
    //           color: controller.isAnswered.value
    //               ? MyColors.btnBorderColor.withOpacity(0.6)
    //               : Color.fromRGBO(65, 85, 75, 1),
    //           width: 6.w, // Custom border width
    //         ),
    //       ),
    //       child: Center(
    //         child: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Text(
    //             "NEXT",
    //             textAlign: TextAlign.center,
    //             style: kSize14DarkW400Text.copyWith(
    //               fontSize: 64.sp,
    //               color: controller.isAnswered.value
    //                   ? MyColors.textColor.withOpacity(0.6)
    //                   : MyColors.white,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // }

  }