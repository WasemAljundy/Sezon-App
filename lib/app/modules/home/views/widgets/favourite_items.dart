import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/utils/colors.dart';

class FavouriteItems extends StatelessWidget {
  const FavouriteItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 120.h,
        ),
        child: Row(
          children: [
            Image.network(
              'https://www.needlenthread.com/wp-content/uploads/2022/08/summer-wheels-bike-01.jpg',
              width: 85.w,
              height: 85.h,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 10.w),
            SizedBox(
              width: 220.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'خزف ملون صنع يدوي',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'هذا النص هو مثال لنص يمكن ان يستبدل توليد هذا النص من مولد النص العربي',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                  Text(
                    '130 ر.س',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customRed,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: AppColors.customRed,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
