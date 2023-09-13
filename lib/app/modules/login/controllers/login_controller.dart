import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/data/repositories/user/auth/auth_repository.dart';
import 'package:sezon_app/app/routes/app_pages.dart';

class LoginController extends GetxController {

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  late TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer()
    ..onTap = navigateToRegisterScreen;

  late final AuthRepository _authRepository = Get.find<AuthRepository>();

  void signIn(String username, String password) {
    _authRepository.signInWithUsernameAndPassword(username, password);
  }


  void _checkRole() async {
    _authRepository.checkRole();
  }

  void navigateToRegisterScreen() {
    Get.toNamed(AppPages.REGISTER);
  }


  @override
  void onInit() {
    super.onInit();
    _checkRole();
  }

}
