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
  class Fact6Screen extends StatelessWidget {
    Fact6Screen({super.key});


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
                            "The following famous cricket tournament is the Ashes Series; a Test cricket series played between England and Australia. The International Cricket Council is the administrator of this series. The first edition of Ashes series was held in 1882-83. The name of the series originated in the satirical obituary published in a British newspaper, The Sporting Times. The obituary was published after Australia won its first Test win in England. The journalist wrote, “In affectionate remembrance of English cricket which died at The Oval. The body will be cremated and the ashes taken to Australia.” Hence, the ashes were associated with the Ashes Series. After England won two of the three-Test series, Melbourne women presented a small urn to England captain Ivo Bligh. The urn contained the ashes of a wooden ball humorously described as “the ashes of Australian cricket.” Although the urn has never been the official trophy of the Ashes series, it has been replicated. The victorious team holds the replica of the urn as a symbol of their victory in an Ashes Series. England and Australia host the series at least once every two years in turn. The series traditionally consists of five Tests, and the winning team holds the Ashes. In case of a draw, the current winning team retains the trophy. Recently, a new version of the Ashes Series was launched. It is the Ashes Lite and consists of three matches.",
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
                      playerName: "Ashes Series",
                      playerImagePath: "assets/images/fact6.png",
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
