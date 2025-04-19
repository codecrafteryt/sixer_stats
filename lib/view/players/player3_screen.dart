  /*
            ---------------------------------------
            Project: Stumped Game Mobile Application
            Date: April 11, 2024
            Author: Ameer from Pakistan
            ---------------------------------------
            Description: Player 3 code
          */
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:sixer_stats/utils/extensions/extentions.dart';
  import 'package:sixer_stats/utils/values/my_color.dart';
  import 'package:sixer_stats/utils/values/style.dart';
  import 'package:sixer_stats/view/widgets/custom_button.dart';
  import '../widgets/custom_appbar.dart';

  class Player3Screen extends StatelessWidget {
    Player3Screen({super.key});

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
                    'assets/images/3.png',
                    width: 372.w,
                    height: 241.h,
                  ),
                  13.sbh,
                  Text(
                      textAlign: TextAlign.center,
                      "Pat Cummins",
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
                        "Pat Cummins had a great year. He kept the Ashes, won the World Test Championship, and led Australia to win the World Cup, where he bowled very well in the final. In 2023, he was named the ICC Men’s Cricketer of the Year. In the 2024 IPL auction, he became the second-most expensive player ever. Cummins is good at both bowling and batting lower down the order, and he’s getting better as a captain."
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
                    //  Get.off(() => Player4Screen());
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
