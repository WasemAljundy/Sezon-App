import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/routes/app_pages.dart';

typedef FbAuthListener = void Function({required bool status});

class LaunchController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late StreamSubscription<User?> _authStateSubscription;

  RxBool isAuthenticated = false.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      _authStateSubscription = _auth.authStateChanges().listen((user) {
        isAuthenticated.value = user != null;
        String route = isAuthenticated.value ? AppPages.HOME : AppPages.LOGIN;
        Get.offNamed(route);
      });
    });
  }

  @override
  void onClose() {
    _authStateSubscription.cancel();
    super.onClose();
  }
}
