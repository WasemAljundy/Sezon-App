import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/payment/controllers/payment.controller.dart';
import 'package:sezon_app/utils/colors.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({
    super.key,
    required this.controller,
  });

  final PaymentController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.methods.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 10),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: ListTile(
            leading: Image.network(
              controller.methods[index].imageUrl,
              height: 100.h,
              width: 50.w,
              fit: BoxFit.fitWidth,
            ),
            title: Text(
              controller.methods[index].title,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Obx(
              () => Checkbox(
                activeColor: AppColors.customRed,
                value: controller.selectedIndex.value == index,
                onChanged: (value) {
                  controller.toggleSelection(index);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
