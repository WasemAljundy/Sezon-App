import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/routes/app_pages.dart';

class LaunchView extends StatefulWidget {
  const LaunchView({Key? key}) : super(key: key);

  @override
  State<LaunchView> createState() => _LaunchViewState();
}

class _LaunchViewState extends State<LaunchView> {
  late StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // _streamSubscription = FbAuthController().checkUserState(
      //   listener: ({required bool status}) {
      //     String route = status ? '/notes_screen' : '/login_screen';
      //     Navigator.pushReplacementNamed(context, route);
      //   },
      // );
      Get.offNamed(Routes.LOGIN);
    });
  }

  @override
  void dispose() {
    // _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/background.png',
          fit: BoxFit.cover,
        ),
        Center(
          child: Image.asset(
            'assets/images/app_icon.png',
            scale: 4,
          ),
        ),
      ],
    );
  }
}
