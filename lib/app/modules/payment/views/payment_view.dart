import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/payment/controllers/payment.controller.dart';
import 'package:sezon_app/app/modules/payment/views/widgets/add_new_address.widget.dart';
import 'package:sezon_app/app/modules/payment/views/widgets/add_spec.widget.dart';
import 'package:sezon_app/app/modules/payment/views/widgets/app_bar_widget.dart';
import 'package:sezon_app/app/modules/payment/views/widgets/pick_payment.widget.dart';

class PaymentView extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PaymentAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Card(
            elevation: 2,
            child: ListTile(
              onTap: () => controller.bottomSheet(context, AddNewAddress()),
              leading: Icon(
                Icons.location_on,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'إضافة عنوان',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          SizedBox(height: 10.h),
          Card(
            elevation: 2,
            child: ListTile(
              onTap: () => controller.bottomSheet(
                  context, PickPayment(controller: controller)),
              leading: Icon(
                Icons.credit_card,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'اختر طريقة دفع',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          SizedBox(height: 10.h),
          Card(
            elevation: 2,
            child: ListTile(
              onTap: () => controller.bottomSheet(
                  context, AddSpec(controller: controller)),
              leading: Icon(
                Icons.redeem,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'اضافة مواصفات المنتج',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
