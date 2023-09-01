import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/home_controller.dart';
import 'package:sezon_app/app/modules/home/views/widgets/category_item_title.dart';
import 'package:sezon_app/app/modules/home/views/widgets/category_items_list.dart';
import 'package:sezon_app/app/modules/home/views/widgets/product_items_list.dart';
import 'package:sezon_app/app/modules/home/views/widgets/search_widget.dart';


class HomeNavPage extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
        child: ListView(
          children: [
            SearchWidget(controller: controller),
            SizedBox(height: 40.h),
            CategoryItemTitle(categoryTitle: 'الفئات'),
            SizedBox(height: 15.h),
            CategoryItemsList(),
            SizedBox(height: 30.h),
            CategoryItemTitle(categoryTitle: 'المنتجات'),
            SizedBox(height: 10.h),
            ProductItemsList(),
          ],
        ),
      );
  }
}



