/*
          ---------------------------------------
          Project: Bat and Brain Game Mobile Application
          Date: April 4, 2024
          Author: Ameer from Pakistan
          ---------------------------------------
          Description: Quiz screen
        */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sixer_stats/controller/setting_controller.dart';
import 'package:sixer_stats/utils/extensions/extentions.dart';
import 'package:sixer_stats/utils/values/my_color.dart';
import 'package:sixer_stats/view/widgets/custom_appbar.dart' show CustomAppBar;
import 'package:sixer_stats/view/widgets/custom_button.dart';

import '../utils/values/style.dart' show kSize11DarkW500Text, kSize14DarkW400Text;

class SettingsScreen extends StatelessWidget {
  final SettingController controller = Get.find();
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),

          // Main Content with Foreground Image
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Foreground decorative image
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/images/icon.png",
                    width: 370.w,
                    height: 402.h,
                  ),
                ),
                80.sbh,
                Text(
                  "Music:",
                  style: kSize14DarkW400Text.copyWith(
                    color: MyColors.white,
                    fontSize: 64.sp,
                  ),
                ),
                20.sbh,
                Row(
                  children: [
                    Text(
                      "0",
                      style: kSize11DarkW500Text.copyWith(
                        fontSize: 32.sp,
                          color: Colors.white
                      ),
                    ),
                    10.sbw,
                    Expanded(
                      child: _VolumeBar(
                        onVolumeChanged: controller.setMusicVolume,
                        volumeValue: controller.musicVolume,
                        onActivate: () {
                          if (!controller.isMusicOn.value) {
                            controller.toggleMusic();
                          }
                        },
                      ),
                    ),
                    10.sbw,
                    Text(
                      '100',
                      //"${(controller.musicVolume.value * 100).toInt()}",
                      style: kSize11DarkW500Text.copyWith(
                          fontSize: 32.sp,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
                20.sbh,
                CustomButton(
                    text: "Back",
                    onPressed: (){
                      Get.back();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _VolumeBar extends StatelessWidget {
  final Function(double) onVolumeChanged;
  final RxDouble volumeValue;
  final VoidCallback onActivate;

  const _VolumeBar({
    required this.onVolumeChanged,
    required this.volumeValue,
    required this.onActivate,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final barWidth = constraints.maxWidth;

        void _handleInteraction(Offset localPosition) {
          final dx = localPosition.dx.clamp(0, barWidth);
          final newVolume = dx / barWidth;
          onVolumeChanged(newVolume);
          onActivate();
        }

        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            _handleInteraction(details.localPosition);
          },
          onTapDown: (details) {
            _handleInteraction(details.localPosition);
          },
          child: Container(
            width: barWidth,
            height: 60, // Increased to fit thumb better
            child: Obx(() {
              final thumbPosition = (volumeValue.value * barWidth) - 20; // 20 = radius offset

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  // Base bar background
                  Container(
                    width: barWidth,
                    height: 20,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  // Filled part of the bar
                  Positioned(
                    top: 20,
                    child: Container(
                      width: volumeValue.value * barWidth,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.green[700],
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  // Circular thumb
                  Positioned(
                    left: thumbPosition,
                    top: 10, // Adjust to center vertically
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF9E9B64), // Match the color from the image
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black87, width: 1),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
