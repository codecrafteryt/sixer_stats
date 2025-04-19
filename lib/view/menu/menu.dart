/*
  ---------------------------------------
  Project: stumped Game Mobile Application
  Date: April 11, 2024
  Author: Ameer from Pakistan
  ---------------------------------------
  Description: menu screen
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sixer_stats/utils/extensions/extentions.dart';
import 'package:sixer_stats/view/quiz/quiz_screen.dart';
import 'package:sixer_stats/view/setting_screen.dart';
import 'package:sixer_stats/view/widgets/custom_button.dart';
import 'package:sixer_stats/view/widgets/custom_setting_widget.dart' show CustomSettingWidget;
import 'package:sixer_stats/view/widgets/volume_button.dart';

import '../facts/fact1_screen.dart';
import '../players/player1_screen.dart' show Player1Screen;

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 60),
                Image.asset(
                  'assets/images/icon.png',
                  width: 370.w,
                  height: 402.h,
                ),
                25.sbh,
                CustomButton(
                  text: "Quiz",
                  height: 90.h,
                  onPressed: () {
                    Get.off(() => QuizScreen());
                  },
                ),
                25.sbh,
                CustomButton(
                  text: "Players",
                  onPressed: () {
                    Get.off(() => Player1Screen());
                  },
                ),
                25.sbh,
                CustomButton(
                  text: "Facts",
                  onPressed: () {
                    Get.off(() => Fact1Screen());
                  },
                ),
                25.sbh,
                CustomSettingWidget(
                  height: 50.h,
                  width: 50.w,
                  onPressed: (){
                    Get.to(() => SettingsScreen());
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
