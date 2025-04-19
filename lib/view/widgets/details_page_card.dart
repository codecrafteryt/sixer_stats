import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPageCard extends StatelessWidget {
  final String playerName;
  final String playerImagePath;
  final VoidCallback onTap;

  const DetailsPageCard({
    Key? key,
    required this.playerName,
    required this.playerImagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> nameParts = playerName.split(' ');

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300.w,
        height: 400.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade300.withOpacity(0.8),
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: Colors.grey.shade700,
            width: 4.w,
          ),
        ),
        child: Column(
          children: [
            // Upper Section with Name + Image
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.9),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.r),
                ),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      playerImagePath,
                      width: 100.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    nameParts.length > 1
                        ? "${nameParts[0]}\n${nameParts.sublist(1).join(' ')}"
                        : playerName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/cricket_bottom_bg.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30.r),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Text", // Change this to dynamic if needed
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black54,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
