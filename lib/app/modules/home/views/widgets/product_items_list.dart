import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/home_controller.dart';
import 'package:sezon_app/utils/colors.dart';

class ProductItemsList extends StatelessWidget {
  const ProductItemsList({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return CupertinoActivityIndicator();
      }
      else if (controller.productsList.isEmpty) {
        return Center(
          child: Text(
            'لا توجد عناصر لعرضها 🙁',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      } else
        return GridView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          itemCount: controller.productsList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Image.network(
                    controller.productsList[index]['product_image'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 110.h,
                  ),
                  Positioned(
                    top: 10.h,
                    right: 110.w,
                    child: Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white30,
                      ),
                      child: InkWell(
                        onTap: () {
                          // controller.selectFavouriteIndex(index);
                        },
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white70,
                        ),
                        // child: Obx(
                        //       () => Icon(
                        //     index == controller.getSelectedIndex()
                        //         ? Icons.favorite
                        //         : Icons.favorite_border,
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          controller.productsList[index]['product_name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      Text(
                        controller.productsList[index]['product_price'],
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.customRed,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
    });
  }
}
