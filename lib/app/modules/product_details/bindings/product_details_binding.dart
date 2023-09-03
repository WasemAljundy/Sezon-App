import 'package:get/get.dart';
import 'package:sezon_app/app/modules/product_details/controllers/product_details_controller.dart';

class ProductsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(
      () => ProductDetailsController(),
    );
  }
}
