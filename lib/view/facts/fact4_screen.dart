  /*
            ---------------------------------------
            Project: Stumped Game Mobile Application
            Date: April 11, 2024
            Author: Ameer from Pakistan
            ---------------------------------------
            Description: fact 4 code
          */
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get.dart';
  import 'package:sixer_stats/utils/extensions/extentions.dart';
import 'package:sixer_stats/view/menu/menu.dart';
  import 'package:sixer_stats/view/widgets/custom_button.dart';
import 'package:sixer_stats/view/widgets/play_card.dart';


  import '../../utils/values/my_color.dart' show MyColors;
  import '../../utils/values/style.dart';
  import '../widgets/custom_appbar.dart';
  import 'fact2_screen.dart';
  class Fact4Screen extends StatelessWidget {
    Fact4Screen({super.key});


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
                            "The Indian Premier League or IPL is India’s most viewed sports tournament. It is a professional men’s Twenty20 cricket league. Teams out of ten Indian cities compete in the league. The Indian Board of Control for Cricket founded the IPL in 2007. Usually, the league is held between the March and May of every year. The league also has an exclusive window for the ICC Future Tours Programme. IPL’s format was similar to that of the Premier League of England. Initially, only eight out of ten cities participated in the league. Then in 2010, two new franchises from Pune and Kerela joined the league. Each participating team plays twice in a home-and-away round-robin format in the league phase. The top four squads will then move on to the playoffs, and the top two teams will play each other in the first Qualifying match. The winner of the first Qualifying match will move to the IPL final. However, the loser will get another chance to qualify for the IPL final by playing the second Qualifying match. In 2014, the IPL was ranked sixth by average attendance among all the sports leagues. Similarly, it is also the most-attended cricket league in the world. In 2010, YouTube broadcasted the IPL live, making IPL the first sporting event to be broadcast live on YouTube. Currently, eight teams participate in the league. The Chennai Super Kings won the 2021 season IPL title.",
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
                      playerName: "Indian Premier League",
                      playerImagePath: "assets/images/fact4.png",
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
