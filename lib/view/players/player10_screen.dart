  /*
            ---------------------------------------
            Project: Stumped Game Mobile Application
            Date: April 11, 2024
            Author: Ameer from Pakistan
            ---------------------------------------
            Description: Player 10 code
          */
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:sixer_stats/utils/extensions/extentions.dart';
  import 'package:sixer_stats/utils/values/my_color.dart';
  import 'package:sixer_stats/utils/values/style.dart';
  import 'package:sixer_stats/view/widgets/custom_button.dart';
  import '../widgets/custom_appbar.dart';

  class Player10Screen extends StatelessWidget {
    Player10Screen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          top: true,
          bottom: false,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/blur.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CustomAppBar(
                    title: 'Facts:',
                  ),
                  20.sbh,
                  Image.asset(
                    'assets/images/10.png',
                    width: 372.w,
                    height: 241.h,
                  ),
                  13.sbh,
                  Text(
                      textAlign: TextAlign.center,
                      "Ravindra Jadeja",
                      style: kSize14DarkW400Text.copyWith(
                          fontSize: 40,
                          color: Colors.white
                      )
                  ),
                  10.sbh,
                  Container(
                    width: 336.w,
                    height: 386.h,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.52),
                      border: Border.all(
                        color: const Color.fromRGBO(65, 85, 75, 1),
                        width: 6.w,
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Ravindra Jadeja is far ahead of everyone else in the Test all-rounder rankings. He’s a top-notch cricketer who excels in batting, spinning, and fielding. Jadeja is a strong batter in all formats and an excellent spinner, able to take wickets in different conditions. His fielding is probably the best in the world. Even though his averages don’t fully show how important he is, his batting average is 12 runs higher than his bowling average in Tests, which highlights his skill. Sometimes, his bowling is overshadowed by Ravichandran Ashwin, and he might not get as much attention as star batsmen like Virat Kohli. Still, Jadeja is a fierce competitor and would be a top pick for a world XI in any format or conditions."
                        ,
                        style: kSize14DarkW400Text.copyWith(
                          fontSize: 32,
                          color: MyColors.white,
                        ),
                      ),
                    ),
                  ),
                  20.sbh,
                  CustomButton(
                    text: "Menu",
                    onPressed: () {
                     // Get.off(() => Menu());
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
