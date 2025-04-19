  /*
            ---------------------------------------
            Project: Stumped Game Mobile Application
            Date: April 11, 2024
            Author: Ameer from Pakistan
            ---------------------------------------
            Description: volume button
          */
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get.dart';
import 'package:sixer_stats/controller/setting_controller.dart';

  class VolumeButton extends StatelessWidget {
    final SettingController controller = Get.find();
    VolumeButton({super.key});

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: controller.toggleMusic,
        child: Obx(() => Container(
          width: 61.w,
          height: 61.h,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.7),
            shape: BoxShape.circle,
          ),
          child: Icon(
            controller.isMusicOn.value ? Icons.volume_up : Icons.volume_off_outlined,
            color: Colors.white,
            size: 50.r,
          ),
        )),
      );
    }
  }