import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sezon_app/app/modules/home/controllers/shopping_controller.dart';
import 'package:sezon_app/utils/colors.dart';

class ProductCartList extends StatelessWidget {
  const ProductCartList({
    super.key,
    required this.controller,
  });

  final ShoppingController controller;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.fetchCartItems(),
      child: ListView.builder(
        itemCount: controller.cartItems.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Slidable(
            endActionPane: ActionPane(
              motion: StretchMotion(),
              extentRatio: 0.5,
              children: [
                SlidableAction(
                  onPressed: (context) {},
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                  backgroundColor: AppColors.yellowColor,
                  icon: Icons.add_circle,
                  foregroundColor: AppColors.whiteColor,
                ),
                SlidableAction(
                  onPressed: (context) => controller.removeCartItem(
                      controller.cartItems[index].product_name),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                  backgroundColor: AppColors.redColor,
                  icon: Icons.delete,
                  foregroundColor: AppColors.whiteColor,
                ),
              ],
            ),
            child: Card(
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              child: ListTile(
                onTap: () {},
                leading: Image.network(
                  controller.cartItems[index].product_image,
                  fit: BoxFit.fill,
                  width: 80.w,
                ),
                title: Text(
                  controller.cartItems[index].product_name,
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  controller.cartItems[index].product_description,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
