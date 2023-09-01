import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hint,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  final String labelText;
  final String? hint;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyle(
          color: Color(0xFFD92728),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
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
