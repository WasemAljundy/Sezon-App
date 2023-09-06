import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/shopping_controller.dart';
import 'package:sezon_app/app/routes/app_pages.dart';
import 'category_controller.dart';
import 'favourite_controller.dart';
import 'home_controller.dart';


class MainNavController extends GetxController {
  final homeController = Get.find<HomeController>();
  final categoryController = Get.find<CategoryController>();
  final shoppingController = Get.find<ShoppingController>();
  final favouriteController = Get.find<FavouriteController>();


  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offNamed(AppPages.LOGIN);
  }

}
