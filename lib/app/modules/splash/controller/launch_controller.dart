import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sezon_app/app/routes/app_pages.dart';

typedef FbAuthListener = void Function({required bool status});

class LaunchController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late StreamSubscription<User?> _authStateSubscription;

  RxBool isAuthenticated = false.obs;
  String role = 'user';

  void _checkRole() async {
    User user = _auth.currentUser!;
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
