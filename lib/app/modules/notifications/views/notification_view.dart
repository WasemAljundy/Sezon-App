import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/notifications/controllers/notification_controller.dart';
import 'package:sezon_app/generated/assets.dart';
import 'package:sezon_app/utils/colors.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'الاشعارات',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: ClipOval(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: Image.asset(Assets.imagesPerson1),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Icon(
              Icons.notifications,
              color: AppColors.customRed,
              size: 28,
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        itemCount: 5,
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(
          thickness: 1,
          color: Colors.grey.shade300,
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              'تم نشر منتج خزف ملون صنع يدوي وبسعر رمزي',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              'منذ دقيقة واحدة',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Container(
              width: 40,
              height: 40,
              color: Colors.grey,
              child: ClipRect(
                child: Image.network(
                  'https://img.freepik.com/free-photo/handmade-embroidery-folk-arts-crafts_469670-53.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
