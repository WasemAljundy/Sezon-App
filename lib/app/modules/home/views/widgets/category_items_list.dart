import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/home_controller.dart';

class CategoryItemsList extends StatelessWidget {
  const CategoryItemsList({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return CupertinoActivityIndicator();
      } else
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 100.h,
          ),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: controller.categoriesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 20.h),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.network(
                        controller.categoriesList[index]['image'],
                        width: 70.w,
                        height: 70.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    controller.categoriesList[index]['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.sp,
                    ),
                  ),
                ],
              );
            },
          ),
        );
    });
  }
}
