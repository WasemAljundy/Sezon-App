import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/generated/assets.dart';
import 'package:sezon_app/utils/colors.dart';

class ProductItemsList extends StatelessWidget {
  const ProductItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      itemCount: 10,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Image.asset(
                Assets.imagesLogoBackground,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 110.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'خزف ملون صنع يدوي',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    '150 ر.س',
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColors.customRed,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
