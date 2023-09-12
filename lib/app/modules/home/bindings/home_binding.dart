import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/category_controller.dart';
import 'package:sezon_app/app/modules/home/controllers/favourite_controller.dart';
import 'package:sezon_app/app/modules/home/controllers/home_controller.dart';
import 'package:sezon_app/app/modules/home/controllers/main_nav.controller.dart';
import 'package:sezon_app/app/modules/home/controllers/shopping_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(),
      // permanent: true,
    );
    Get.put<CategoryController>(
      CategoryController(),
      // permanent: true,
    );
    Get.put<ShoppingController>(
      ShoppingController(),
      // permanent: true,
    );
    Get.put<FavouriteController>(
      FavouriteController(),
      // permanent: true,
    );
    Get.put<MainNavController>(
      MainNavController(),
      // permanent: true,
    );
  }
}
