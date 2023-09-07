import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/user_profile/controllers/user_profile.controller.dart';
import 'package:sezon_app/generated/assets.dart';
import 'package:sezon_app/utils/colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.controller,
  });

  final UserProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          height: 110.h,
          width: 110.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 4.w,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Obx(
                () {
              final selectedImage = controller.pickedFileRx.value;
              return ClipOval(
                child: selectedImage != null
                    ? Image.file(
                  File(selectedImage.path),
                  fit: BoxFit.cover,
                )
                    : Image.asset(
                  Assets.imagesPerson1,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        Container(
          width: 25.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: InkWell(
            onTap: () => controller.selectPicture(),
            child: Icon(
              Icons.camera_alt,
              color: AppColors.customRed,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}
