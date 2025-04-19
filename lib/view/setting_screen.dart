import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sixer_stats/controller/setting_controller.dart';
import 'package:sixer_stats/utils/extensions/extentions.dart';
import 'package:sixer_stats/utils/values/my_color.dart';
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
                  textAlign: TextAlign.center,
                  "Music:",
                  style: kSize14DarkW400Text.copyWith(
                    color: MyColors.white,
                    fontSize: 64.sp,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Obx(() => Switch(
                    //   value: controller.isMusicOn.value,
                    //   onChanged: (_) => controller.toggleMusic(),
                    //   activeColor: Colors.green[700],
                    // )),
                  ],
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
                        onVolumeChanged: (value) {
                          controller.setMusicVolume(value);
                        },
                        volumeValue: controller.musicVolume,
                        onActivate: () {
                          if (!controller.isMusicOn.value) {
                            controller.toggleMusic();
                          }
                        },
                      ),
                    ),
                    10.sbw,
                    Obx(() => Text(
                      "${(controller.musicVolume.value * 100).toInt()}",
                      style: kSize11DarkW500Text.copyWith(
                          fontSize: 32.sp,
                          color: Colors.white
                      ),
                    )),
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
          // Clamp to ensure we stay within bar boundaries
          final dx = localPosition.dx.clamp(0.0, barWidth);
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
            height: 60,
            child: Obx(() {
              // Calculate proper thumb position
              final thumbWidth = 40.0;
              final thumbPosition = (volumeValue.value * (barWidth - thumbWidth));

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

                  // Filled part of the bar (green)
                  Positioned(
                    top: 20,
                    left: 0,
                    child: Container(
                      width: thumbPosition + (thumbWidth / 2),
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
                    top: 10,
                    child: Container(
                      width: thumbWidth,
                      height: thumbWidth,
                      decoration: BoxDecoration(
                        color: const Color(0xFF9E9B64),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black87, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 2.0,
                            offset: Offset(0, 1),
                          ),
                        ],
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
