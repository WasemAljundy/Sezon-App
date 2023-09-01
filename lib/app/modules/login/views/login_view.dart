import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/login/controllers/login_controller.dart';
import 'package:sezon_app/app/modules/login/views/widgets/app_text_field.dart';
import 'package:sezon_app/app/modules/login/views/widgets/auth_background.dart';
import 'package:sezon_app/app/routes/app_pages.dart';
import 'package:sezon_app/config/translations/strings_enum.dart';
import 'package:sezon_app/generated/assets.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthBackground(title: Strings.login.tr),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: AppTextField(
                controller: controller.nameController,
                labelText: Strings.username.tr,
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: AppTextField(
                controller: controller.passwordController,
                obscureText: true,
                labelText: Strings.password.tr,
                keyboardType: TextInputType.text,
                hint: '12345',
              ),
            ),
            SizedBox(height: 5.h),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    Strings.forgetPassword.tr,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(340.h, 50.w),
                backgroundColor: Color(0xffD92728),
              ),
              onPressed: () => Get.offNamed(AppPages.HOME),
              child: Text(Strings.login.tr),
            ),
            SizedBox(height: 20.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: Strings.notHaveAccount.tr,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    recognizer: controller.tapGestureRecognizer,
                    text: Strings.newAccount.tr,
                    style: TextStyle(
                      color: Color(0xffD92728),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

