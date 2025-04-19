  /*
            ---------------------------------------
            Project: Stumped Game Mobile Application
            Date: April 11, 2024
            Author: Ameer from Pakistan
            ---------------------------------------
            Description: custom button
          */
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sixer_stats/utils/values/my_color.dart';
import 'package:sixer_stats/utils/values/style.dart';

  class CustomButton extends StatelessWidget {
    final String text;
    final VoidCallback onPressed;
    final Color borderColor;
    final double borderRadius;
    final double borderOpacity;
    final double height;
    final double width;

    const CustomButton({
      Key? key,
      required this.text,
      required this.onPressed,
      this.borderColor = const Color.fromRGBO(129, 130, 129, 1),
      this.borderRadius = 5.0,
      this.borderOpacity = 0.52,
      this.height = 108.0,
      this.width = 232.0,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,  // Custom width
          height: height,  // Custom height
          decoration: BoxDecoration(
            color: const Color.fromRGBO(71, 76, 65, 1).withOpacity(0.8),
            borderRadius: BorderRadius.circular(borderRadius), 
            border: Border.all(
              color: borderColor.withOpacity(borderOpacity),
              width: 6.w, // Border width
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                textAlign: TextAlign.center,
                text,
                style: kSize14DarkW400Text.copyWith(
                  fontSize: 40.sp,
                  color: MyColors.white
                )
              ),
          ),
        ),
      );
    }
  }
