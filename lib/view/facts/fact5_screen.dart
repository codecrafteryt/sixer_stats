/*
          ---------------------------------------
          Project: Stumped Game Mobile Application
          Date: April 11, 2024
          Author: Ameer from Pakistan
          ---------------------------------------
          Description: fact 5 code
        */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sixer_stats/utils/extensions/extentions.dart';
import 'package:sixer_stats/view/menu/menu.dart' show Menu;
import 'package:sixer_stats/view/widgets/custom_button.dart';
import 'package:sixer_stats/view/widgets/play_card.dart';


import '../../utils/values/my_color.dart' show MyColors;
import '../../utils/values/style.dart';
import '../widgets/custom_appbar.dart';
import 'fact2_screen.dart';
class Fact5Screen extends StatelessWidget {
  Fact5Screen({super.key});


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
                          "The Champions League Twenty20 is one of the famous global cricket tournaments in domestic level cricket. Also known as the CLT20, it was an annual international Twenty20 cricket competition. CLT20’s first edition was held in 2009. The Indian Board of Control for Cricket (BCCI), Cricket Australia, and Cricket South Africa jointly owned the league. The league’s game edition had different formats, and the participating team number also was different. In addition, the game had a group stage and a two-round knockout stage. The tournament’s participating teams are from the top cricketing nations. The premier Twenty20 tournaments of the participating nation determined the team. The tournament mainly targeted the Indian audience. Therefore, the tournament has featured more teams from India than any other county. Hence, India is also the first choice for hosting the CLT20. Usually, the tournament was held between September and October, either in India or South Africa. However, Australia’s weather in September made it unsuitable to host the tournament and its time zone was also undesirable for the broadcaster. In 2015, the three founding cricket boards announced the tournament’s cancelation due to the poor viewership, lack of audience, and unstable sponsorships. The 2014 Champions League Twenty20 was the last edition of the tournament. The Chennai Super Kings were the winner of the last CLT20 title.",
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
                    playerName: "Champions League Twenty20",
                    playerImagePath: "assets/images/fact5.png",
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
