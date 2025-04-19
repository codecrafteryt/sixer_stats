  /*
      ---------------------------------------
      Project: Bat and Brain Game Mobile Application
      Date: April 4, 2024
      Author: Ameer from Pakistan
      ---------------------------------------
      Description: result screen
    */

  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get.dart';
import 'package:sixer_stats/utils/extensions/extentions.dart';
import 'package:sixer_stats/utils/values/my_color.dart';
import 'package:sixer_stats/view/menu/menu.dart';

  import '../../utils/values/style.dart' show kSize14DarkW400Text;
  import '../widgets/custom_button.dart';
import 'quiz_screen.dart';

  class ResultScreen extends StatelessWidget {
    //final QuizController controller = Get.find();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/blur.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  20.sbh,
                  Text(
                    "Result:",
                    style: kSize14DarkW400Text.copyWith(
                      color: MyColors.white,
                      fontSize: 96.sp,
                      shadows: [
                        Shadow(
                          offset: Offset(2.w, 2.h),
                          blurRadius: 2.r,
                          color: const Color.fromRGBO(51, 57, 20, 1),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    '',
                    //"\n${ controller.score.value}/${controller.questions.length}",
                    style: kSize14DarkW400Text.copyWith(
                      color: MyColors.white,
                      fontSize: 96.sp,
                      shadows: [
                        Shadow(
                          offset: Offset(2.w, 2.h),
                          blurRadius: 2.r,
                          color: const Color.fromRGBO(51, 57, 20, 1),
                        ),
                      ],
                    ),
                  ),
                  30.sbh,

                  CustomButton(
                    height: 90.h,
                    width: 336.w,
                    text: "Menu",
                    onPressed: () {
                      Get.offAll(() => Menu());
                    },
                  ),
                  30.sbh,
                  CustomButton(
                    height: 90.h,
                    width: 336.w,
                    text: "Retry",
                    onPressed: () {
                     Get.offAll(() => QuizScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

