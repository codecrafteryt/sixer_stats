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