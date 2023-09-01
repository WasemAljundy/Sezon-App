import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer()
    ..onTap = navigateToRegisterScreen;


  @override
  void onInit() {
    super.onInit();
  }

  void navigateToRegisterScreen() {
    Get.back();
  }

  @override
  void onClose() {
    super.onClose();
  }
}