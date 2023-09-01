import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemTitle extends StatelessWidget {
  CategoryItemTitle({
    super.key,
    required this.categoryTitle,
  });

  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25.h,
          width: 3.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.red,
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          categoryTitle,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
