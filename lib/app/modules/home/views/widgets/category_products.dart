import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/routes/app_pages.dart';
import 'package:sezon_app/utils/colors.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 255.w,
        maxHeight: double.infinity,
      ),
      child: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        itemCount: 5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.r,
          crossAxisSpacing: 9.r,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(AppPages.PRODUCT_DETAILS);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x3600000F),
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDatKCg42Wx6R--iAkaDVQk53G4KBoYHdqpQ&usqp=CAU',
                            height: 70.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 8.h,
                          right: 75.w,
                          child: Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white30,
                            ),
                            child: InkWell(
                              onTap: () {
                                // controller.selectFavouriteIndex(index);
                              },
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white60,
                              ),
                              // child: Obx(
                              //       () => Icon(
                              //     index == controller.getSelectedIndex()
                              //         ? Icons.favorite
                              //         : Icons.favorite_border,
                              //     color: Colors.white,
                              //   ),
                              // ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
