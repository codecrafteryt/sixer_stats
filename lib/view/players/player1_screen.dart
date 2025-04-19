  /*
            ---------------------------------------
            Project: Stumped Game Mobile Application
            Date: April 11, 2024
            Author: Ameer from Pakistan
            ---------------------------------------
            Description: Player 1 code
          */
  import 'package:flutter/material.dart';import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sixer_stats/utils/extensions/extentions.dart';
import 'package:sixer_stats/utils/values/my_color.dart';
import 'package:sixer_stats/utils/values/style.dart';
import 'package:sixer_stats/view/menu/menu.dart';
import 'package:sixer_stats/view/widgets/custom_button.dart';
import 'package:sixer_stats/view/widgets/play_card.dart';
import '../widgets/custom_appbar.dart';

  class Player1Screen extends StatelessWidget {
    Player1Screen({super.key});

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
                            "Shakib Al Hasan from Bangladesh is a true inspiration for aspiring all-rounders. His versatility in both departments has played a significant role in elevating Bangladesh’s cricketing status on the global stage. Shakib’s aggressive yet composed style of play has earned him accolades from cricketing legends and fans alike.",
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
                      playerName: "Shakib Al Hasan",
                      playerImagePath: "assets/images/1.png",
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

