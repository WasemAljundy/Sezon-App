import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sezon_app/app/components/custom_snackbar.dart';
import 'package:sezon_app/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer()
    ..onTap = navigateToRegisterScreen;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> registerWithUsernameAndPassword(
      String username, String password, String mobile) async {
    try {
      if (checkPassword()) {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: '$username@email.com',
          password: password,
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': username,
          'Password': password,
          'mobile': mobile,
        });
        Get.toNamed(AppPages.REGISTER_CODE);
        CustomSnackBar.showCustomSnackBar(
          title: 'Created Successfully',
          message: 'Account Created, Please Verify your mobile',
        );
        return true;
      }
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'Error Occurred',
        message: e.toString(),
      );
      Logger().w(e);
    }
    return false;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  bool checkPassword() {
    if (passwordController.text == confirmPasswordController.text) {
      return true;
    }
    CustomSnackBar.showCustomErrorSnackBar(
      title: "Password didn't match",
      message: 'Please check your confirmation password ',
    );
    return false;
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
