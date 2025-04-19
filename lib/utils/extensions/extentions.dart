/*
          ---------------------------------------
          Project: Stumped Game Mobile Application
          Date: April 11, 2024
          Author: Ameer from Pakistan
          ---------------------------------------
          Description: extension
        */
  import 'package:flutter/cupertino.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';

  extension Space on num {
    SizedBox get sbh => SizedBox(
        height: ScreenUtil().setHeight(toDouble(),
        ));

    SizedBox get sbw => SizedBox(
      width: ScreenUtil().setWidth(toDouble()),
    );
  }