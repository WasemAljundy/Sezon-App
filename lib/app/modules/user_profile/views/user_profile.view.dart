import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/user_profile/controllers/user_profile.controller.dart';
import 'package:sezon_app/app/modules/user_profile/views/widgets/profile_image.widget.dart';
import 'package:sezon_app/app/modules/user_profile/views/widgets/user_input.widget.dart';


class UserProfileView extends GetView<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 30,
        ),
        title: Text(
          'الحساب',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                UserInputs(controller: controller),
                ProfileImage(controller: controller)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

