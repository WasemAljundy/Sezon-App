import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:sezon_app/utils/colors.dart';

class RelatedProducts extends StatelessWidget {
  const RelatedProducts({
    super.key,
    required this.controller,
  });

  final ProductDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 130.h,
      ),
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                        ),
                        child: Image.network(
                          'https://i.etsystatic.com/12960085/r/il/1512bc/3472458806/il_fullxfull.3472458806_ifx7.jpg',
                          width: 100.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 10.h,
                        right: 65.w,
                        child: Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white30,
                          ),
                          child: InkWell(
                            onTap: () {
                              controller.selectFavouriteIndex(index);
                            },
                            child: Obx(
                                  () => Icon(
                                index == controller.getSelectedIndex()
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.white60,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 7.h),
                Text(
                  'اكليل ورد معلق',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  '150 ر.س',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.customRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
