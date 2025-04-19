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
    final double fontSize; // 👈 New fontSize parameter

    const CustomButton({
      Key? key,
      required this.text,
      required this.onPressed,
      this.borderColor = const Color.fromRGBO(129, 130, 129, 1),
      this.borderRadius = 5.0,
      this.borderOpacity = 0.52,
      this.height = 108.0,
      this.width = 232.0,
      this.fontSize = 40.0, // 👈 Default font size
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(71, 76, 65, 1).withOpacity(0.8),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor.withOpacity(borderOpacity),
              width: 6.w,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                text,
                style: kSize14DarkW400Text.copyWith(
                  fontSize: fontSize.sp, // 👈 Use passed fontSize
                  color: MyColors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

