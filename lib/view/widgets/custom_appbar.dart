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
import 'package:sixer_stats/utils/values/style.dart';
import 'package:sixer_stats/view/menu/menu.dart';
import 'package:sixer_stats/view/setting_screen.dart';
import 'package:sixer_stats/view/widgets/custom_setting_widget.dart';

import 'volume_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Back button
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF51636E).withOpacity(0.8),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: const Color.fromRGBO(103, 118, 86, 1,),
                    width: 2, // adjust as needed
                  ),
                ),
                child: Icon(
                  Icons.close,
                  color: const Color.fromRGBO(207, 97, 90, 1),
                  size: 40.r,
                ),
              ),
            ),
            // Title
            Text(
              title,
              style: kSize11DarkW500Text.copyWith(
                fontSize: 30.sp,
                color: Colors.white,
              ),
            ),
            // Sound toggle button
            CustomSettingWidget(
              height: 50.h,
              width: 50.w,
              onPressed: () {
                Get.to(() => SettingsScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8.0);
}
