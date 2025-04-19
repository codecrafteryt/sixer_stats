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


  import '../../utils/values/my_color.dart' show MyColors;
import '../../utils/values/style.dart';
import '../widgets/custom_appbar.dart';
  import 'fact2_screen.dart';

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
                    'assets/images/fact1.png',
                    width: 372.w,
                    height: 241.h,
                  ),
                  13.sbh,
                  Text(
                    textAlign: TextAlign.center,
                    "Length of the Cricket pitch",
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
                        "In the history of more than 150 years of Test cricket, the length of the cricket pitch has remained unchanged. The length of the pitch which was 22 yards when the first Test was played in 1877, continues to remain the same even after more than 150 years of Test cricket. The length of the cricket pitch in feet is 66ft.",
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
                      Get.off(() => Fact2Screen());
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
