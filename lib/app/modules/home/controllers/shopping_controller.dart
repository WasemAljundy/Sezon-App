import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ShoppingController extends GetxController {

  late TabController tabController;
  RxInt selectedIndex = 0.obs;


  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
