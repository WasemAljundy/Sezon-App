import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:sezon_app/generated/assets.dart';

class ImagesPageView extends StatelessWidget {
  const ImagesPageView({
    super.key,
    required this.controller,
  });

  final ProductDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: PageView.builder(
        itemCount: 3,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        onPageChanged: (index) => controller.changePage(index),
        itemBuilder: (context, index) {
          return Image.asset(
            Assets.imagesLogoBackground,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
