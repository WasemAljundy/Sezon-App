import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/generated/assets.dart';

class AuthBackground extends StatelessWidget {
  AuthBackground({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.imagesLoginBackground,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 50.h,
          left: 150.w,
          child: Image.asset(
            Assets.imagesAppIcon,
            fit: BoxFit.cover,
            scale: 7,
          ),
        ),
        Positioned(
          top: 250.r,
          width: 370.w,
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
