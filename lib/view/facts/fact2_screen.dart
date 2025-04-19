
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

  class Fact2Screen extends StatelessWidget {
    Fact2Screen({super.key});


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
                            "The Caribbean Premier League is a Twenty20 cricket tournament. Cricket West Indies was the founder of the tournament in 2013, and Hero MotorCorp sponsors the league while the Caribbean hosts it. The league replaced the Caribbean Twenty20 as the premier Twenty20 competition. The league has six teams, and the game has two stages, namely the group stage and a knockout stage. The Premier League uses six stadiums, and each is a home field for the six participating teams. These teams have 15 contracted players, each with five international players and four under 23. Similarly, each team has one local and one international player. Since the tournament’s inception, Trinbago Knight Riders have been the most successful team. They have won the League four times. The Barbados Tridents and the Jamaica Tallawahs have won twice. In the 2020 season, the Trinbago Knight Riders won the Premier League for the fourth time when they defeated St. Lucia Zouks in the final. St. Kitts & Nevis Patriots are the current champions of 2021. They defeated the Saint Lucia Kings by three wickets and won their first Caribbean Premier League trophy.",
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
                      playerName: "Caribbean Premier League",
                      playerImagePath: "assets/images/fact2.png",
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
