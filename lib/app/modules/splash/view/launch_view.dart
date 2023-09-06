import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/splash/controller/launch_controller.dart';
import 'package:sezon_app/generated/assets.dart';

class LaunchView extends GetView<LaunchController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LaunchController(),
      builder: (controller) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              Assets.imagesBackground,
              fit: BoxFit.cover,
            ),
            Center(
              child: Image.asset(
                Assets.imagesAppIcon,
                scale: 4,
              ),
            ),
          ],
        );
      },
    );
  }


}