import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/utils/colors.dart';

class AdminTextField extends StatelessWidget {
  const AdminTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.onTap,
    this.hint,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
  });

  final Function()? onTap;
  final String labelText;
  final String? hint;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final IconData? suffixIcon;
  final bool obscureText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onTap: onTap,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(suffixIcon, color: Colors.grey),
        floatingLabelStyle: TextStyle(
          color: AppColors.customRed,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: Color(0xFFD92728),
            width: 1.5,
          ),
        ),
      ),
    );
  }

}
