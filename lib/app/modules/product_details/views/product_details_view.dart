import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:sezon_app/app/modules/product_details/views/widgets/app_bar_widget.dart';
import 'package:sezon_app/app/modules/product_details/views/widgets/buttons_widget.dart';
import 'package:sezon_app/app/modules/product_details/views/widgets/header_title.dart';
import 'package:sezon_app/app/modules/product_details/views/widgets/images_page_view.dart';
import 'package:sezon_app/app/modules/product_details/views/widgets/page_indicator.dart';
import 'package:sezon_app/app/modules/product_details/views/widgets/related_products.dart';
import 'package:sezon_app/utils/colors.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: ProductAppBar(),
        body: controller.isLoading.value
            ? Center(child: CupertinoActivityIndicator())
            : ListView(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ImagesPageView(controller: controller),
                  SizedBox(height: 15.h),
                  PageIndicator(controller: controller),
                  SizedBox(height: 30.h),
                  Text(
                    controller.product['product_name'],
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    controller.product['product_price'],
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.customRed,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    controller.product['product_description'],
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  HeaderTitle(),
                  SizedBox(height: 20.h),
                  RelatedProducts(controller: controller),
                  SizedBox(height: 20.h),
                  ButtonsWidget(controller: controller),
                ],
              ),
      );
    });
  }
}
