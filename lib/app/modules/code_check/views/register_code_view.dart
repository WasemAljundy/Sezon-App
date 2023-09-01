import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/code_check/controllers/register_code_controller.dart';
import 'package:sezon_app/app/modules/login/views/widgets/auth_background.dart';
import 'package:sezon_app/app/routes/app_pages.dart';
import 'package:sezon_app/utils/colors.dart';

class RegisterCodeView extends GetView<RegisterCodeController> {
  const RegisterCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthBackground(title: 'رمز التحقق'),
            Text(
              'لقد قمنا بارسال رمز التحقق إلى هذا الرقم +9720592072429',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 30.h),
            VerificationCode(
              textStyle: TextStyle(fontSize: 20.0),
              keyboardType: TextInputType.number,
              underlineColor: Colors.red,
              autofocus: true,
              length: 4,
              margin: EdgeInsets.all(10),
              fullBorder: true,
              cursorColor: Colors.blue,
              onEditing: (bool value) {},
              onCompleted: (String value) {
                print(value);
              },
            ),
            SizedBox(height: 50.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(340.h, 50.w),
                backgroundColor: AppColors.customRed,
              ),
              onPressed: () => Get.offNamed(AppPages.HOME),
              child: Text('ارسل'),
            ),
          ],
        ),
      ),
    );
  }
}
