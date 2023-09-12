import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/favourite_controller.dart';
import 'package:sezon_app/utils/colors.dart';

class FavouriteItems extends StatelessWidget {
  const FavouriteItems({
    super.key,
    required this.controller,
  });

  final FavouriteController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: controller.favouriteItems.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            elevation: 1,
            margin: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 120.h,
              ),
              child: Row(
                children: [
                  Image.network(
                    controller.favouriteItems[index].product_image,
                    width: 85.w,
                    height: 85.h,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    width: 220.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.favouriteItems[index].product_name,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          controller.favouriteItems[index].product_description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          controller.favouriteItems[index].product_price,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.customRed,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () =>
                          controller.removeFavouriteItem(
                            controller.favouriteItems[index].product_name,
                          ),
                      icon: Icon(
                        Icons.delete,
                        color: AppColors.customRed,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
