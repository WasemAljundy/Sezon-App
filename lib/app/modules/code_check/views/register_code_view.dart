import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sezon_app/app/modules/code_check/controllers/register_code_controller.dart';
import 'package:sezon_app/app/modules/login/views/widgets/auth_background.dart';
import 'package:sezon_app/utils/colors.dart';

class RegisterCodeView extends GetView<RegisterCodeController> {
  const RegisterCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RegisterCodeController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                AuthBackground(title: 'رمز التحقق'),
                Text(
                  ' لقد قمنا بارسال رمز التحقق إلى هذا الرقم +972592463727',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.h),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    autofocus: true,
                    showCursor: true,
                    length: 6,
                    keyboardType: TextInputType.number,
                    animationCurve: Curves.easeIn,
                    defaultPinTheme: PinTheme(
                      width: 50.w,
                      height: 50.h,
                      textStyle: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.customRed),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onCompleted: (value) {
                      controller.sentCode = value;
                      print(value);
                    },
                  ),
                ),
                SizedBox(height: 50.h),
                ElevatedButton(
                  onPressed: () => controller.verifyCode(controller.sentCode),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(340.h, 50.w),
                    backgroundColor: AppColors.customRed,
                  ),
                  child: Text('ارسل'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
