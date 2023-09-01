import 'package:flutter/material.dart';

class AppColors {

  static const Color primaryColor = Color(0xFF0993BD);
  static const Color customRed = Color(0xffD92728);
  static const Color secondaryColor = Color(0xFF09AFE1);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color offWhiteColor = Color(0xFFF6F6F6);
  static const Color blackColor = Color(0xFF101010);
  static const Color greyColor = Color(0xFF484C52);
  static const Color lightGreyColor = Color(0xFFBDBDBD);
  static const Color redColor = Color(0xFFEB5757);
  static const Color orangeColor = Color(0xFFFFB319);
  static const Color yellowColor = Color(0xFFFFD465);
  static const Color greenColor = Color(0xFF00A881);

  // Gradients
  static const Gradient primaryGradient = LinearGradient(
    colors: [primaryColor, secondaryColor],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}
