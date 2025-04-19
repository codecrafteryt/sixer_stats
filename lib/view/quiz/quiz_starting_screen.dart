import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sixer_stats/utils/extensions/extentions.dart';
import 'package:sixer_stats/utils/values/style.dart';
import 'package:sixer_stats/view/quiz/quiz_screen.dart';
import 'package:sixer_stats/view/widgets/custom_button.dart';

class QuizStartingScreen extends StatelessWidget {
  const QuizStartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            children: [
              60.sbh,
              Image.asset(
                'assets/images/icon.png',
                width: 370.w,
                height: 402.h,
              ),
              40.sbh,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Guess who is in the picture!",
                textAlign: TextAlign.center,
                style:kSize11DarkW500Text.copyWith(
                  fontSize: 48,
                  color: Colors.white,
                ),
                ),
              ),
              50.sbh,
              CustomButton(
                  text: "Start",
                  onPressed: (){
                    Get.to(() => QuizScreen(),);
                  })
            ],
          ),
        ),
    );
  }
}
