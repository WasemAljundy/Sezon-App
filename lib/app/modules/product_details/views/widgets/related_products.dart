import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:sezon_app/utils/colors.dart';

class RelatedProducts extends StatelessWidget {
  const RelatedProducts({
    super.key,
    required this.controller,
  });

  final ProductDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 130.h,
      ),
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.r),
                      ),
                      child: Image.network(
                        'https://www.snugglymonkey.com/cdn/shop/products/Circle_of_flowers_6_600x.jpg?v=1582711276',
                        width: 100.w,
                        height: 85.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 10.h,
                      right: 65.w,
                      child: Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white30,
                        ),
                        child: InkWell(
                          onTap: () {
                            controller.selectFavouriteIndex(index);
                          },
                          child: Obx(
                                () => Icon(
                              index == controller.getSelectedIndex()
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7.h),
                Text(
                  'اكليل ورد معلق',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  '150 ر.س',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.customRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
