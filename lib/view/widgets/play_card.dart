import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sixer_stats/utils/extensions/extentions.dart';

class PlayerCard extends StatelessWidget {
  final String playerName;
  final String playerImagePath;
  final VoidCallback? onTap;

  const PlayerCard({
    Key? key,
    required this.playerName,
    required this.playerImagePath,
    this.onTap, // Optional callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> nameParts = playerName.split(' ');

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 328.w,
        height: 320.h,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.grey.shade300.withOpacity(0.8),
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(
            color: Color.fromRGBO(111, 111, 111, 1),
            width: 14.w,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Player Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                playerImagePath,
                width: 200.w,
                height: 111.h,
                fit: BoxFit.cover,
              ),
            ),
            16.sbh,
            Text(
              nameParts.length > 1
                  ? "${nameParts[0]}\n${nameParts.sublist(1).join(' ')}"
                  : playerName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 3,
                    offset: Offset(1, 2),
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
