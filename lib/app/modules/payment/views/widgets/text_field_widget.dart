import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/utils/colors.dart';

class PaymentTextField extends StatelessWidget {
  const PaymentTextField({
    super.key,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.hint,
  });

  final String labelText;
  final String? hint;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.r),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
          color: Colors.grey,
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: AppColors.customRed,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
