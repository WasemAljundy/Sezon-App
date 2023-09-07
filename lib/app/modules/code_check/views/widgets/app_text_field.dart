import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/utils/colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hint,
    this.suffixIcon,
    this.function,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  final String labelText;
  final String? hint;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool obscureText;
  final IconData? suffixIcon;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
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
        suffixIcon: IconButton(
          onPressed: function,
          icon: Icon(
            suffixIcon,
            color: AppColors.customRed,
          ),
        ),
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: AppColors.customRed,
            width: 1.5.w,
          ),
        ),
      ),
    );
  }
}
