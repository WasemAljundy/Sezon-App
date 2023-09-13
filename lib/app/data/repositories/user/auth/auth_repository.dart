import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sezon_app/app/components/custom_snackbar.dart';
import 'package:sezon_app/app/routes/app_pages.dart';
import 'package:sezon_app/config/translations/strings_enum.dart';

class AuthRepository {

  late TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer()
    ..onTap = navigateToRegisterScreen;

  String role = 'user';
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  late String verifyId;


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


  void checkRole() async {
    User user = FirebaseAuth.instance.currentUser!;
    final DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    role = snap['role'];

    if(role == 'user'){
      Logger().w('THIS IS USER AUTH');
    } else if(role == 'admin'){
      Logger().w('THIS IS ADMIN AUTH');
    }
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

  //**************************** Register Controller *************************//

  Future<bool> registerWithUsernameAndPassword(
      String username, String password,String confirmPassword, String mobile) async {
    try {
      if (checkPassword(password, confirmPassword)) {
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
          'role': 'user',
        });
        Get.toNamed(AppPages.REGISTER_CODE);
        CustomSnackBar.showCustomSnackBar(
          title: Strings.createdSuccessfully.tr,
          message: Strings.verifyMobile.tr,
        );
        return true;
      }
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: Strings.errorOccurred.tr,
        message: e.toString(),
      );
      Logger().w(e);
    }
    return false;
  }

  bool checkPassword(String password, String confirmPassword) {
    if (password == confirmPassword) {
      return true;
    }
    CustomSnackBar.showCustomErrorSnackBar(
      title: Strings.passwordDidNotMatch.tr,
      message: Strings.checkConfirmationPass.tr,
    );
    return false;
  }

  //**************************** Code Verification ***************************//


  Future<String?> getMobileNumber() async {
    try {
      String? uid = FirebaseAuth.instance.currentUser?.uid;
      Logger().w('UID ${uid}');
      if (uid != null) {
        DocumentReference userDocRef =
        FirebaseFirestore.instance.collection('users').doc(uid);
        DocumentSnapshot userDocSnapshot = await userDocRef.get();
        if (userDocSnapshot.exists) {
          String? mobileNumber = userDocSnapshot.get('mobile');
          Logger().w(mobileNumber);
          return mobileNumber;
        } else {
          Logger().w('Document is not exists');
          return null;
        }
      } else {
        Logger().w('User is not signed in');
        return null;
      }
    } catch (e) {
      print('Error fetching mobile number: $e');
      return null;
    }
  }

  Future<void> sendVerificationCode() async {
    isLoading.value = true;
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: await getMobileNumber(),
      verificationCompleted: (phoneAuthCredential) async {
        isLoading.value = false;
        Logger().w('phoneAuthCredential ${phoneAuthCredential}');
      },
      verificationFailed: (error) {
        isLoading.value = false;
        Logger().w(error);
      },
      codeSent: (verificationId, forceResendingToken) {
        isLoading.value = false;
        verifyId = verificationId;
        Logger().w('verificationId ${verificationId}');
        Logger().w('verifyId ${verifyId}');
      },
      codeAutoRetrievalTimeout: (verificationId) {
        Logger().w('verificationId ${verificationId}');
      },
    );
  }

  Future<void> verifyCode(String smsCode) async {
    try {
      isLoading.value = true;
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verifyId,
        smsCode: smsCode,
      );
      await _firebaseAuth.signInWithCredential(credential);
      Get.offNamed(AppPages.HOME);
      CustomSnackBar.showCustomSnackBar(
        title: Strings.verifySuccess.tr,
        message: Strings.verifySuccessMsg.tr,
      );
    } catch (e) {
      isLoading.value = false;
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'Verification Error',
        message: e.toString(),
      );
    }
  }


}