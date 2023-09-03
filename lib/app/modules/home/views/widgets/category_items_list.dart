import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemsList extends StatelessWidget {
  const CategoryItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 100.h,
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.network(
                  'https://i2.wp.com/www.thinkmakeshareblog.com/wp-content/uploads/Shirt-Embroidery-_-thinkmakeshareblog.jpg?fit=822%2C1233&ssl=1',
                  width: 70.w,
                  height: 70.h,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                'الاكسسوارات',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
