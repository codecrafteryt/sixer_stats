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
import 'package:sixer_stats/view/widgets/custom_button.dart';


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
                  'assets/images/fact5.png',
                  width: 372.w,
                  height: 241.h,
                ),
                13.sbh,
                Text(
                    textAlign: TextAlign.center,
                    "Australia defeated England in the inaugural and the centenary Test match by 45 runs",
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
                      "In the first-ever Test match in 1877, Australia defeated England by a margin of 45 runs. However, even in the centenary Test match in 1977, Australia once again got the better of England by a similar margin of 45 runs. Both the Tests were played at the Melbourne Cricket Ground in Melbourne.",
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
                    //Get.off(() => Fact6Screen());
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
