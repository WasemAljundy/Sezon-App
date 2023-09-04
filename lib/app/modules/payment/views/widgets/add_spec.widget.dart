import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/payment/controllers/payment.controller.dart';
import 'package:sezon_app/app/modules/payment/views/widgets/text_field_widget.dart';
import 'package:sezon_app/utils/colors.dart';

class AddSpec extends StatelessWidget {
  const AddSpec({
    super.key,
    required this.controller,
  });

  final PaymentController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
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
                'إضافة مواصفات المنتج',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          SizedBox(height: 40.h),
          PaymentTextField(
            labelText: 'اسم المنتج',
            hint: 'مثال: خزف ملون صنع يدوي',
          ),
          SizedBox(height: 40.h),
          PaymentTextField(
            labelText: 'الكمية',
            hint: 'مثال: 5 قطع',
          ),
          SizedBox(height: 40.h),
          PaymentTextField(
            labelText: 'لون المنتج',
            hint: 'مثال: الأسود',
          ),
          SizedBox(height: 40.h),
          PaymentTextField(
            labelText: 'الحجم',
            hint: 'مثال: xxl',
          ),
          SizedBox(height: 40.h),
          ElevatedButton(
            onPressed: () => Get.back(),
            child: Text('حفظ'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.customRed,
            ),
          ),
        ],
      ),
    );
  }
}
