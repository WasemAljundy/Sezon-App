import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/code_check/views/widgets/app_text_field.dart';
import 'package:sezon_app/app/modules/user_profile/controllers/user_profile.controller.dart';
import 'package:sezon_app/utils/colors.dart';

class UserInputs extends StatelessWidget {
  const UserInputs({
    super.key,
    required this.controller,
  });

  final UserProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 50.h),
      padding: EdgeInsetsDirectional.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(20.r),
          topEnd: Radius.circular(20.r),
        ),
      ),
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 70.h),
          AppTextField(
            controller: controller.userNameController,
            labelText: 'اسم المستخدم',
            hint: 'اسم المستخدم الجديد',
          ),
          SizedBox(height: 30.h),
          AppTextField(
            controller: controller.mobileController,
            labelText: 'رقم الهاتف',
            hint: 'رقم الهاتف الجديد',
          ),
          SizedBox(height: 30.h),
          Obx(
            () => AppTextField(
              controller: controller.passwordController,
              obscureText: controller.passwordText.value,
              function: () => controller.passwordVisibility(),
              suffixIcon: controller.passwordText.value
                  ? Icons.visibility
                  : Icons.visibility_off,
              labelText: 'كلمة المرور',
              hint: 'كلمة المرور الجديدة',
            ),
          ),
          SizedBox(height: 30.h),
          ElevatedButton(
            onPressed: () => controller.performUpdate(),
            child: Text(
              'تحديث البيانات',
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50.h),
              backgroundColor: AppColors.customRed,
            ),
          ),
        ],
      ),
    );
  }
}
