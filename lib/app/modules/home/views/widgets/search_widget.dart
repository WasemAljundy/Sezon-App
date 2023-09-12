import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/home_controller.dart';
import 'package:sezon_app/utils/colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(
          elevation: MaterialStatePropertyAll(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade100),
          leading: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 15.h),
          ),
          hintText: 'كلمة البحث هنا',
          hintStyle: MaterialStateProperty.all(
            TextStyle(
              color: Colors.grey.shade400,
              fontSize: 16.sp,
            ),
          ),
          controller: controller.editController,
          onChanged: (value) {
            controller.searchProducts(value);
          },
        ),
        Obx(() {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.searchedProducts.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                    controller.searchedProducts[index]['product_image']),
                title: Text(
                  controller.searchedProducts[index]['product_name'],
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  controller.searchedProducts[index]['product_price'],
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.customRed,
                  ),
                ),
              );
            },
          );
        })
      ],
    );
  }
}
