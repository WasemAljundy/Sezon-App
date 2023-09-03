import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/shopping_controller.dart';
import 'package:sezon_app/utils/colors.dart';

class ShoppingNavPage extends GetView<ShoppingController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(height: 20),
          TabBar(
            labelStyle: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
            indicatorColor: AppColors.customRed,
            onTap: (index) => controller.changeTabIndex(index),
            tabs: [
              Tab(
                text: 'طلبات قيد التنفيذ',
              ),
              Tab(
                text: 'طلبات مستلمة',
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () => IndexedStack(
                index: controller.selectedIndex.value,
                children: [
                  ListView.builder(
                    itemCount: 8,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        child: ListTile(
                          onTap: () {},
                          leading: Image.network(
                            'https://crewelghoul.com/wp-content/uploads/2022/07/butterfly-embroidery-1.jpg.webp',
                            fit: BoxFit.fill,
                            width: 80.w,
                          ),
                          title: Text(
                            'خزف ملون صنع يدوي',
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'هذا النص هو مثال لنص يمكن ان يستبدل توليد هذا النص من مولد النص العربي',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Center(
                    child: Text('Tab 2 Content'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
