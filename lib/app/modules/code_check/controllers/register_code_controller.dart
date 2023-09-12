import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:sezon_app/app/components/custom_snackbar.dart';
import 'package:sezon_app/app/routes/app_pages.dart';
import 'package:sezon_app/config/translations/strings_enum.dart';

class RegisterCodeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  late String sentCode;
  late String verifyId;

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
    await _auth.verifyPhoneNumber(
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
      await _auth.signInWithCredential(credential);
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

  @override
  void onInit() {
    getMobileNumber();
    sendVerificationCode();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
