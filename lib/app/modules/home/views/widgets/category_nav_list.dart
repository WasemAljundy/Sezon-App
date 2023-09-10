import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/category_controller.dart';

class CategoryNavList extends StatelessWidget {
  const CategoryNavList({
    super.key,
    required this.controller,
  });

  final CategoryController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100.w,
          color: Colors.white10,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 5.w,
            ),
            shrinkWrap: true,
            itemCount: controller.categoriesList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Obx(() {
                return InkWell(
                  onTap: () {
                    controller.changeTabIndex(index);
                    controller.selectedCategory.value =
                    controller.categoriesList[index]['name'];
                    controller.fetchProducts();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Card(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 20.h,
                            ),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.network(
                                controller.categoriesList[index]['image'],
                                width: 50.w,
                                height: 50.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text(
                            controller.categoriesList[index]['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: index == controller.getSelectedIndex()
                            ? Colors.red
                            : Colors.transparent,
                        width: 3.w,
                        height: 115.h,
                      ),
                    ],
                  ),
                );
              });
            },
          ),
        ),
      ],
    );
  }
}
