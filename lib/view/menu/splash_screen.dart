  /*
          ---------------------------------------
          Project: Stumped Game Mobile Application
          Date: April 11, 2024
          Author: Ameer from Pakistan
          ---------------------------------------
          Description: Splash screen code
        */
  import 'dart:async';
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sixer_stats/utils/extensions/extentions.dart';
import 'package:sixer_stats/view/menu/menu.dart';

  class SplashScreen extends StatefulWidget {
    const SplashScreen({super.key});

    @override
    _SplashScreenState createState() => _SplashScreenState();
  }

  class _SplashScreenState extends State<SplashScreen> {
    double progress = 0.0;

    @override
    void initState() {
      super.initState();
      _startProgress();
    }

    void _startProgress() {
      Timer.periodic(const Duration(milliseconds: 100), (timer) {
        if (progress < 1.0) {
          setState(() {
            progress += 0.05;
          });
        } else {
          timer.cancel();
          Future.delayed(const Duration(milliseconds: 200), () {
            if (mounted) {
              Get.offAll(() => Menu());
            }
          });
        }
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icon.png',
                  width: 370.w,
                  height: 402.h,
                ),
                176.sbh,
                SpinKitRing(
                  color: Color.fromRGBO(134, 185, 205, 1),
                  size: 100.0,
                  lineWidth: 8.0,
                ),
              ],
            ),
          ],
        ),
      );
    }
  }