import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/routes/app_pages.dart';

class LoginController extends GetxController {

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  late TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer()
    ..onTap = navigateToRegisterScreen;


  @override
  void onInit() {
    super.onInit();
  }

  void navigateToRegisterScreen() {
    Get.toNamed(AppPages.REGISTER);
  }

  @override
  void onClose() {
    super.onClose();
  }
}