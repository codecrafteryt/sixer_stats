  /*
            ---------------------------------------
            Project: Stumped Game Mobile Application
            Date: April 11, 2024
            Author: Ameer from Pakistan
            ---------------------------------------
            Description: fact 1 code
          */
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get.dart';
import 'package:sixer_stats/utils/extensions/extentions.dart';
import 'package:sixer_stats/view/widgets/custom_button.dart';
import 'package:sixer_stats/view/widgets/play_card.dart';
 import '../../utils/values/my_color.dart' show MyColors;
import '../../utils/values/style.dart';
import '../menu/menu.dart';
import '../widgets/custom_appbar.dart';

  class Fact1Screen extends StatelessWidget {
    Fact1Screen({super.key});

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
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(
                children: [
                  Column(
                    children: <Widget>[
                      CustomAppBar(
                        title: 'Player',
                      ),
                      140.sbh,
                      Container(
                        width: 328.w,
                        height: 720.h,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300.withOpacity(0.8),
                          border: Border.all(
                            color: const Color.fromRGBO(111, 111, 111, 1),
                            width: 14.w,
                          ),
                        ),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.only(top: 210),
                          child: Text(
                            textAlign: TextAlign.center,
                            "We will start our list of the most famous cricket tournaments with the Big Bash League. Also commonly known as KFC Big Bash League, it is a Twenty20 cricket league with an Australian professional franchise. Cricket Australia established the Big Bash League in 2011. Since its beginning, the league has featured eight city-based franchises sponsored by the fast-food chicken outlet KFC. The tournament’s game format has been the same every year except for the inaugural season. Australia hosts the tournament during December, January, and February. Big Bash League is one of the two T20 cricket leagues featured among the top ten domestic sports leagues in average attendance. Out of the eight teams that feature in the league, six teams have won the title at least once. In 2015, Cricket Australia announced the Women’s Big Bash League, and it would share the names and colors of the existing men’s team. The Sydney Thunder won the inaugural game. The winner of the 2020-21 season was the Sydney Sixers. They stood victorious against the Perth Scorchers by 27 runs in the final.",
                            style: kSize14DarkW400Text.copyWith(
                              fontSize: 32,
                              color: MyColors.white,
                            ),
                          ),
                        ),
                      ),
                      20.sbh,
                      CustomButton(
                        text: "Close",
                        onPressed: () {
                          Get.to(() => Menu());
                        },
                      ),
                    ],
                  ),

                  // Proper use of Positioned inside Stack
                  Positioned(
                    top: 120.h,
                    left: 24.w,
                    right: 24.w,
                    child: PlayerCard(
                      playerName: "Big Bash League",
                      playerImagePath: "assets/images/fact1.png",
                      onTap: () {
                        //Get.to(() => Menu());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
