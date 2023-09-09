import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/data/repositories/admin/products/controllers/admin_products.controller.dart';
import 'package:sezon_app/app/data/repositories/admin/products/views/widgets/add_new_product.widget.dart';

class AdminProductsView extends GetView<AdminProductsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'اضافة منتج',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: AddNewProduct(
        controller: controller,
      ),
    );
  }
}
