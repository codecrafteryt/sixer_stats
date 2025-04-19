import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixer_stats/utils/extensions/extentions.dart';
import 'package:sixer_stats/view/players/player1_screen.dart';
import 'package:sixer_stats/view/players/player2_screen.dart';
import 'package:sixer_stats/view/players/player3_screen.dart';
import 'package:sixer_stats/view/players/player4_screen.dart';
import 'package:sixer_stats/view/players/player5_screen.dart';
import 'package:sixer_stats/view/players/player6_screen.dart';
import 'package:sixer_stats/view/players/player7_screen.dart';
import 'package:sixer_stats/view/players/player8_screen.dart';
import 'package:sixer_stats/view/widgets/custom_appbar.dart';
import 'package:sixer_stats/view/widgets/play_card.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

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
                title: "Players",
              ),
              80.sbh,
              PlayerCard(
                playerName: "Shakib Al Hasan",
                playerImagePath: "assets/images/1.png",
                onTap: () {
                  Get.to(() => Player1Screen());
                },
              ),
              80.sbh,
              PlayerCard(
                playerName: "Ben Stokes",
                playerImagePath: "assets/images/player1.png",
                onTap: () {
                  Get.to(() => Player2Screen());
                },
              ),80.sbh,
              PlayerCard(
                playerName: "Hardik Pandya",
                playerImagePath: "assets/images/player3.png",
                onTap: () {
                  Get.to(() => Player3Screen());
                },
              ),80.sbh,
              PlayerCard(
                playerName: "Mohammad Nabi",
                playerImagePath: "assets/images/player4.png",
                onTap: () {
                  Get.to(() => Player4Screen());
                },
              ),80.sbh,
              PlayerCard(
                playerName: "Jason Holder",
                playerImagePath: "assets/images/player5.png",
                onTap: () {
                  Get.to(() => Player5Screen());
                },
              ),80.sbh,
              PlayerCard(
                playerName: "Chris Woakes",
                playerImagePath: "assets/images/player6.png",
                onTap: () {
                  Get.to(() => Player6Screen());
                },
              ),80.sbh,
              PlayerCard(
                playerName: "Andre Russel",
                playerImagePath: "assets/images/player7.png",
                onTap: () {
                  Get.to(() => Player7Screen());
                },
              ),80.sbh,
              PlayerCard(
                playerName: "Glenn Maxwell",
                playerImagePath: "assets/images/player8.png",
                onTap: () {
                  Get.to(() => Player8Screen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
