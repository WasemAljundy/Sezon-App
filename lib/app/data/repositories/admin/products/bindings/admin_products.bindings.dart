import 'package:get/get.dart';
import 'package:sezon_app/app/data/repositories/admin/products/controllers/admin_products.controller.dart';

class AdminProductsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AdminProductsController>(
      AdminProductsController(),
      permanent: true,
    );
  }
}
