import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/app/modules/home/controllers/main_nav.controller.dart';
import 'package:sezon_app/generated/assets.dart';

class LogoutAvatar extends StatelessWidget {
  const LogoutAvatar({
    super.key,
    required this.controller,
  });

  final MainNavController controller;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'logout') {
          controller.signOut();
        }
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'logout',
            child: Center(child: Text('Logout')),
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ];
      },
      child: CircleAvatar(
        backgroundImage: AssetImage(Assets.imagesPerson1),
        backgroundColor: Colors.grey.shade300,
      ),
    );
  }
}
