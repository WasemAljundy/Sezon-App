import 'package:cloud_firestore/cloud_firestore.dart';
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

  String role = 'user';


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


  void _checkRole() async {
    User user = FirebaseAuth.instance.currentUser!;
    final DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    role = snap['role'];

    if(role == 'user'){
      Logger().w('THIS IS USER AUTH');
    } else if(role == 'admin'){
      Logger().w('THIS IS ADMIN AUTH');
    }
  }

  @override
  void onInit() {
    super.onInit();
    _checkRole();
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
