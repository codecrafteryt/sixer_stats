import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sixer_stats/controller/quiz_controller.dart';
import 'package:sixer_stats/utils/extensions/extentions.dart';
import 'package:sixer_stats/utils/values/my_color.dart';
import 'package:sixer_stats/utils/values/style.dart';
import 'package:sixer_stats/view/widgets/custom_appbar.dart';

class QuizScreen extends StatelessWidget {
  final QuizController quizController = Get.find();
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
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              CustomAppBar(
                title: "QUIZ",
              ),
              Expanded(
                child: Obx(() => SingleChildScrollView(
                  child: Column(
                    children: [
                      20.sbh,
                      Container(
                        width: 328.w,
                        height: 350.h,
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(50.r),
                          border: Border.all(
                            color: Color.fromRGBO(111, 111, 111, 1),
                            width: 14.w,
                          ),
                        ),
                        child: quizController.questions[quizController.currentQuestionIndex.value].imagePath != null
                            ? Image.asset(
                          quizController.questions[quizController.currentQuestionIndex.value].imagePath!,
                          fit: BoxFit.contain,
                        )
                            : const Center(
                          child: Icon(
                            Icons.sports_cricket,
                            size: 100,
                            color: Color(0xFF1E3A8A),
                          ),
                        ),
                      ),
                      50.sbh,
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: quizController.questions[quizController.currentQuestionIndex.value].options.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemBuilder: (context, index) => _buildAnswerOption(index, quizController),
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerOption(int index, QuizController controller) {
    return Obx(() {
      bool isSelected = controller.selectedAnswerIndex.value == index;
      bool isCorrect = controller.questions[controller.currentQuestionIndex.value].correctAnswerIndex == index;
      Color backgroundColor = const Color.fromRGBO(71, 76, 65, 1);
      Color borderColor;
      if (controller.isAnswered.value) {
        if (isSelected) {
          borderColor = isCorrect
              ? const Color.fromRGBO(93, 185, 102, 1)
              : const Color.fromRGBO(255, 99, 71, 1);
        } else if (isCorrect) {
          borderColor = const Color.fromRGBO(93, 185, 102, 1);
        } else {
          borderColor = const Color.fromRGBO(129, 130, 129, 1);
        }
      } else {
        borderColor = const Color.fromRGBO(65, 85, 75, 1);
      }
      return GestureDetector(
        onTap: () {
          if (!controller.isAnswered.value) {
            controller.selectAnswerAndContinue(index);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(
              color: borderColor,
              width: 9.w,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                controller.questions[controller.currentQuestionIndex.value].options[index],
                textAlign: TextAlign.center,
                style: kSize14DarkW400Text.copyWith(
                  fontSize: 20.sp,
                  color: MyColors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(3.w, 3.h),
                      blurRadius: 3.r,
                      color: const Color.fromRGBO(51, 57, 20, 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}