import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/shopping_controller.dart';
import 'category_controller.dart';
import 'favourite_controller.dart';
import 'home_controller.dart';

class MainNavController extends GetxController {
  final homeController = Get.find<HomeController>();
  final categoryController = Get.find<CategoryController>();
  final shoppingController = Get.find<ShoppingController>();
  final favouriteController = Get.find<FavouriteController>();
}
