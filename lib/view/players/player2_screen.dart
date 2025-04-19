  /*
            ---------------------------------------
            Project: Stumped Game Mobile Application
            Date: April 11, 2024
            Author: Ameer from Pakistan
            ---------------------------------------
            Description: Player 2 code
          */
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:sixer_stats/utils/extensions/extentions.dart';
  import 'package:sixer_stats/utils/values/my_color.dart';
  import 'package:sixer_stats/utils/values/style.dart';
  import 'package:sixer_stats/view/widgets/custom_button.dart';
  import '../widgets/custom_appbar.dart';

  class Player2Screen extends StatelessWidget {
    Player2Screen({super.key});

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
                    'assets/images/2.png',
                    width: 372.w,
                    height: 241.h,
                  ),
                  13.sbh,
                  Text(
                      textAlign: TextAlign.center,
                      "Kagiso Rabada",
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
                        "Kagiso Rabada started playing international cricket in 2014. Since then, he has become a very effective fast bowler in all formats of the game. Rabada’s control, speed, and bounce make him valuable even on difficult pitches. In Test cricket, he has a low average of just 22 runs per wicket. He is also a regular player in T20 leagues around the world. Rabada has the best strike rate in Test matches for bowlers who have played more than 18 Tests. He has become the main bowler for South Africa after Dale Steyn and Morne Morkel retired.",
                        style: kSize14DarkW400Text.copyWith(
                          fontSize: 32,
                          color: MyColors.white,
                        ),
                      ),
                    ),
                  ),
                  20.sbh,
                  CustomButton(
                    text: "Next",
                    onPressed: () {
                     // Get.off(() => Player3Screen());
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
