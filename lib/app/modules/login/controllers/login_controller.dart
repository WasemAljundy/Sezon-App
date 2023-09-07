import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sezon_app/app/components/custom_snackbar.dart';
import 'package:sezon_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  late TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer()
    ..onTap = navigateToRegisterScreen;

  Future<User?> signInWithUsernameAndPassword(
      String username, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: '$username@email.com',
        password: password,
      );
      navigateToHomeScreen();
      return userCredential.user;
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'Error Occurred',
        message: e.toString(),
      );
      Logger().w(e);
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
  }

  void navigateToRegisterScreen() {
    Get.toNamed(AppPages.REGISTER);
  }

  void navigateToHomeScreen() {
    Get.offNamed(AppPages.HOME);
    CustomSnackBar.showCustomSnackBar(
      title: 'اهلا بك مجددا',
      message: 'تمت عملية تسجيل الدخول بنجاح',
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
