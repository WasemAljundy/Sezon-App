import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/controllers/favourite_controller.dart';
import 'package:sezon_app/app/modules/home/views/widgets/favourite_items.dart';

class FavouriteNavPage extends GetView<FavouriteController> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FavouriteItems();
      },
    );
  }
}

