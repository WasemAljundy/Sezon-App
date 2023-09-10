import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/data/repositories/admin/products/controllers/admin_products.controller.dart';
import 'package:sezon_app/app/data/repositories/admin/products/views/widgets/admin_text_field.dart';
import 'package:sezon_app/utils/colors.dart';

class AddNewProduct extends StatelessWidget {
  const AddNewProduct({
    super.key,
    required this.controller,
  });

  final AdminProductsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0.r),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              Container(
                width: 3.w,
                height: 25.h,
                color: AppColors.customRed,
              ),
              SizedBox(width: 10.w),
              Text(
                'اضافة منتج جديد',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          AdminTextField(
            controller: controller.productNameController,
            labelText: 'اسم المنتج',
            hint: 'خزف ملون',
          ),
          SizedBox(height: 30.h),
          AdminTextField(
            controller: controller.productDescriptionController,
            maxLines: 5,
            labelText: 'وصف المنتج',
            hint: 'مثال: منتج تمت صناعته بأفضل الخامات ...',
          ),
          SizedBox(height: 30.h),
          AdminTextField(
            controller: controller.productPriceController,
            labelText: 'السعر',
            hint: '120 ر.س',
          ),
          SizedBox(height: 30.h),
          AdminTextField(
            controller: controller.imageController,
            onTap: () => controller.selectPicture(),
            suffixIcon: Icons.cloud_upload,
            labelText: 'اضافة صورة للمنتج',
            hint: 'ارفق صورة',
          ),
          SizedBox(height: 30.h),
          Obx(() {
            return DropdownButton<String>(
              isExpanded: true,
              items: controller.categoryItems,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17.sp,
              ),
              value: controller.selectedCategory.value,
              onChanged: (value) {
                if (value != null) {
                  controller.selectedCategory.value = value;
                }
              },
            );
          }),
          SizedBox(height: 30.h),
          ElevatedButton(
            onPressed: () => controller.addProduct(),
            child: Text('اضافة'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.customRed,
            ),
          ),
        ],
      ),
    );
  }
}
