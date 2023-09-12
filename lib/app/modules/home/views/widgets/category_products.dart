import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/category_controller.dart';
import 'package:sezon_app/app/routes/app_pages.dart';
import 'package:sezon_app/utils/colors.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({
    super.key,
    required this.controller,
  });

  final CategoryController controller;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 255.w,
        maxHeight: double.infinity,
      ),
      child: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        itemCount: controller.productsList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.r,
          crossAxisSpacing: 9.r,
        ),
        itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed(
                  AppPages.PRODUCT_DETAILS,
                  arguments: controller.productsList[index]['product_name'],
                );
              },
              child: controller.productsList.isEmpty
                  ? Center(
                      child: Text(
                        'لا توجد منتجات لهذه الفئة حتى اللحظة 🙁',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x3600000F),
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.r),
                                    topRight: Radius.circular(8.r),
                                  ),
                                  child: Image.network(
                                    controller.productsList[index]
                                        ['product_image'],
                                    height: 70.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 8.h,
                                  right: 75.w,
                                  child: Container(
                                    width: 30.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white30,
                                    ),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(height: 7.h),
                                Text(
                                  controller.productsList[index]
                                      ['product_name'],
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                Text(
                                  controller.productsList[index]
                                      ['product_price'],
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.customRed,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
            );
        },
      ),
    );
  }
}
