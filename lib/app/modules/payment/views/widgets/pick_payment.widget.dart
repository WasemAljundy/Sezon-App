import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/payment/controllers/payment.controller.dart';
import 'package:sezon_app/app/modules/payment/views/widgets/card_info.widget.dart';
import 'package:sezon_app/app/modules/payment/views/widgets/payment_methods.widget.dart';
import 'package:sezon_app/utils/colors.dart';

class PickPayment extends StatelessWidget {
  const PickPayment({
    super.key,
    required this.controller,
  });

  final PaymentController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
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
                'إختر طريقة الدفع',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          SizedBox(height: 30.h),
          PaymentMethods(controller: controller),
          SizedBox(height: 30.h),
          ElevatedButton(
            child: Text('التالي'),
            onPressed: () {
              Get.back();
              showModalBottomSheet(
                showDragHandle: true,
                isScrollControlled: true,
                context: context,
                builder: (context) => CardInfo(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.customRed,
            ),
          ),
        ],
      ),
    );
  }
}
