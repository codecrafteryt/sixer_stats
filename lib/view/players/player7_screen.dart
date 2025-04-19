  /*
            ---------------------------------------
            Project: Stumped Game Mobile Application
            Date: April 11, 2024
            Author: Ameer from Pakistan
            ---------------------------------------
            Description: Player 7 code
          */
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:sixer_stats/utils/extensions/extentions.dart';
  import 'package:sixer_stats/utils/values/my_color.dart';
  import 'package:sixer_stats/utils/values/style.dart';
  import 'package:sixer_stats/view/widgets/custom_button.dart';
  import '../widgets/custom_appbar.dart';

  class Player7Screen extends StatelessWidget {
    Player7Screen({super.key});

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
                    'assets/images/1.png',
                    width: 372.w,
                    height: 241.h,
                  ),
                  13.sbh,
                  Text(
                      textAlign: TextAlign.center,
                      "Heinrich Klaasen",
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
                        "Putting a batter with little Test experience this high up might be debated. Heinrich Klaasen has only played four Tests so far, but his amazing hitting in white-ball cricket makes him one of the best players in the world. The South African has the second-highest strike rate in IPL history. Among the top 13 players with the highest career ODI strike rates, Klaasen is the only one who averages 40 with the bat. He can take down any bowling attack and has become a popular player in T20 cricket for his ability to hit boundaries in the middle of an innings and finish strong with big shots."
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
                    text: "Next",
                    onPressed: () {
                    //  Get.off(() => Player8Screen());
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
