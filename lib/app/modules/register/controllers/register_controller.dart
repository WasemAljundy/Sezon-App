import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/data/repositories/user/auth/auth_repository.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  late TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer()
    ..onTap = navigateToRegisterScreen;

  late final AuthRepository _authRepository = Get.find<AuthRepository>();

  void registerWithUsernameAndPassword(
    String username,
    String password,
    String confirmPassword,
    String mobile,
  ) {
    _authRepository.registerWithUsernameAndPassword(
      username,
      password,
      confirmPassword,
      mobile,
    );
  }

  void navigateToRegisterScreen() {
    Get.back();
  }
}
