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

import '../utils/values/style.dart' show kSize14DarkW400Text;

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
                    height: 100.h,
                    width: 100.w,
                  ),
                ),
                20.sbh,

                // Custom App Bar
                CustomAppBar(
                  title: "Setting",
                ),
                27.sbh,

                Text(
                  "Music",
                  style: kSize14DarkW400Text.copyWith(
                    color: MyColors.textColor,
                    fontSize: 32.sp,
                  ),
                ),
                20.sbh,

                Row(
                  children: [
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
                  ],
                ),
                130.sbh,

                Text(
                  "SFX",
                  style: kSize14DarkW400Text.copyWith(
                    color: MyColors.textColor,
                    fontSize: 32.sp,
                  ),
                ),
                20.sbh,

                Row(
                  children: [
                    10.sbw,
                    Expanded(
                      child: _VolumeBar(
                        onVolumeChanged: controller.setSoundVolume,
                        volumeValue: controller.soundVolume,
                        onActivate: () {
                          if (!controller.isSoundOn.value) {
                            controller.toggleSound();
                          }
                        },
                      ),
                    ),
                  ],
                ),
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
          onActivate(); // Auto-enable music/SFX
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
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Obx(() => Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: volumeValue.value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            )),
          ),
        );
      },
    );
  }
}
