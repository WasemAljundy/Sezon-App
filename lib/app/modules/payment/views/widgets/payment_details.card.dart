import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/utils/colors.dart';

class PaymentDetailsCard extends StatelessWidget {
  PaymentDetailsCard({
    Key? key,
    required this.title,
    required this.leadingIcon,
    this.fontSize = 14.0,
  });

  final String title;
  final IconData leadingIcon;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: Icon(
          leadingIcon,
          color: Colors.black,
          size: 30,
        ),
        title: Text(
          title,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: fontSize.sp, // Use fontSize.sp to convert it to screen util
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        trailing: Icon(
          Icons.edit_note,
          size: 32,
          color: AppColors.customRed,
        ),
      ),
    );
  }
}
