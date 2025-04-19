import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixer_stats/utils/extensions/extentions.dart';
import 'package:sixer_stats/view/facts/fact1_screen.dart';
import 'package:sixer_stats/view/facts/fact5_screen.dart';
import 'package:sixer_stats/view/facts/fact6_screen.dart';
import 'package:sixer_stats/view/widgets/custom_appbar.dart';
import 'package:sixer_stats/view/widgets/play_card.dart';
import 'fact2_screen.dart';
import 'fact3_screen.dart';
import 'fact4_screen.dart';

class FactScreen extends StatelessWidget {
  const FactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomAppBar(
                title: "Tournament",
              ),
              80.sbh,
              PlayerCard(
                playerName: "Big Bash League",
                playerImagePath: "assets/images/fact1.png",
                onTap: () {
                  Get.to(() => Fact1Screen());
                },
              ),
              80.sbh,
              PlayerCard(
                playerName: "Caribbean Premier League",
                playerImagePath: "assets/images/fact2.png",
                onTap: () {
                  Get.to(() => Fact2Screen());
                },
              ),80.sbh,
              PlayerCard(
                playerName: "Asia Cup",
                playerImagePath: "assets/images/fact3.png",
                onTap: () {
                  Get.to(() => Fact3Screen());
                },
              ),80.sbh,
              PlayerCard(
                playerName: "Indian Premier League",
                playerImagePath: "assets/images/fact4.png",
                onTap: () {
                  Get.to(() => Fact4Screen());
                },
              ),80.sbh,
              PlayerCard(
                playerName: "Champions League Twenty20",
                playerImagePath: "assets/images/fact5.png",
                onTap: () {
                  Get.to(() => Fact5Screen());
                },
              ),80.sbh,
              PlayerCard(
                playerName: "Ashes Series",
                playerImagePath: "assets/images/fact6.png",
                onTap: () {
                  Get.to(() => Fact6Screen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
