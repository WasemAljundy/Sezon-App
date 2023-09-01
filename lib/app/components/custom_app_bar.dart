import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(56.0.h);

  final Widget leadingWidget;
  final Widget title;
  final Widget trailingWidget;

  CustomAppBar({
    required this.title,
    this.leadingWidget = const SizedBox.shrink(),
    this.trailingWidget = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.2,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leadingWidget,
          title,
          trailingWidget,
        ],
      ),
    );
  }
}
