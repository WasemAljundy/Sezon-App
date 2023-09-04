import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/payment/views/widgets/text_field_widget.dart';
import 'package:sezon_app/utils/colors.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({
    super.key,
  });

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
                'إضافة عنوان جديد',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          SizedBox(height: 30.h),
          PaymentTextField(
            labelText: 'الدولة',
            hint: 'الامارات',
          ),
          SizedBox(height: 30.h),
          PaymentTextField(
            labelText: 'المنطقة',
            hint: 'المنطقة، المحافظة، ولاية...',
          ),
          SizedBox(height: 30.h),
          PaymentTextField(
            labelText: 'المدينة',
            hint: 'الشيخ زايد',
          ),
          SizedBox(height: 30.h),
          PaymentTextField(
            labelText: 'الشارع',
            hint: 'الشارع، المنزل، الوحدة السكنية...',
          ),
          SizedBox(height: 30.h),
          PaymentTextField(
            labelText: 'الرمز البريدي',
            hint: '872',
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 30.h),
          PaymentTextField(
            labelText: 'رقم الهاتف',
            hint: '972592463727+',
          ),
          SizedBox(height: 30),
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
