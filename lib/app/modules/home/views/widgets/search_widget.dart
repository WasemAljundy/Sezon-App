import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/app/modules/home/controllers/home_controller.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      elevation: MaterialStatePropertyAll(0),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.grey.shade100),
      leading: const Icon(
        Icons.search,
        color: Colors.grey,
      ),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 15.h),
      ),
      hintText: 'كلمة البحث هنا',
      hintStyle: MaterialStateProperty.all(
        TextStyle(
          color: Colors.grey.shade400,
          fontSize: 16,
        ),
      ),
      controller: controller.editController,
      onChanged: (value) {
        if (controller.formKey.currentState!.validate()) {
          controller.getUserBySearch(value);
        }
      },
    );
  }
}
