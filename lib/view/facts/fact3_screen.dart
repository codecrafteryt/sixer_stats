  /*
            ---------------------------------------
            Project: Stumped Game Mobile Application
            Date: April 11, 2024
            Author: Ameer from Pakistan
            ---------------------------------------
            Description: fact 3 code
          */
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get.dart';
  import 'package:sixer_stats/utils/extensions/extentions.dart';
  import 'package:sixer_stats/view/widgets/custom_button.dart';


  import '../../utils/values/my_color.dart' show MyColors;
  import '../../utils/values/style.dart';
  import '../menu/menu.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/play_card.dart';

  class Fact3Screen extends StatelessWidget {
    Fact3Screen({super.key});


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
                            "The Asia Cup is the only continental championship with a one-day international and Twenty20 international cricket format. The Asian Cricket was founded in 1983, and the tournament was established in the same year. The objective of establishing the tournament was to promote goodwill between Asian countries. The cup was initially scheduled to be held every two years. Therefore, the cup alternates every two years between the ODI and T20 format. The initial edition of the cup was held in the United Arab Emirates. India, Sri Lanka, and Pakistan participated in the first edition. India emerged victorious in the finals against Sri Lanka. The cup has seen its fair share of ups and downs throughout the series due to political situations between countries. In 1986, India boycotted the tournament due to strained cricket relations with Sri Lanka. Similarly, Pakistan boycotted the series in the 1990-91 season because of the political strain with India. Despite the ups and downs, the cup has promoted good relations between countries, which was its initial objective. The most successful team in the tournament has been India with seven titles, while Sri Lanka comes in second with five titles won.",
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
                      playerName: "Asia Cup",
                      playerImagePath: "assets/images/fact3.png",
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
