import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sezon_app/app/components/custom_snackbar.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer()
    ..onTap = navigateToRegisterScreen;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> createAccount(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.sendEmailVerification();
      signOut();
      CustomSnackBar.showCustomSnackBar(
        title: 'Created Successfully!',
        message: 'Account Created, Please Verify the email!',
      );
      return true;
    } catch (e) {
      Logger().w(e);
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'Error Occurred',
        message: e.toString(),
      );
    }
    return false;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

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
