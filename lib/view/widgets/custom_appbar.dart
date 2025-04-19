/*
          ---------------------------------------
          Project: Stumped Game Mobile Application
          Date: April 11, 2024
          Author: Ameer from Pakistan
          ---------------------------------------
          Description: app bar
        */
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:get/get.dart';
import 'package:sixer_stats/view/menu/menu.dart';

import 'volume_button.dart';

  class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
    final String title;

    const CustomAppBar({
      Key? key,
      required this.title,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back button
              GestureDetector(
                onTap: () {
                  if (Get.isOverlaysOpen) {
                    Get.back();
                  } else {
                    Get.offAll(() => Menu());
                  }
                  debugPrint("1212");
                },
                child: Container(
                  width: 61.w,
                  height: 61.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF51636E).withOpacity(0.8),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromRGBO(103, 118, 86, 1), // ← your rgba color
                      width: 2, // adjust as needed
                    ),
                  ),
                  child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 40.r,
                    ),
                ),
              ),
              // Title
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 55.sp,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Sound toggle button
              VolumeButton(),
            ],
          ),
        ),
      );
    }

    @override
    Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8.0);
  }