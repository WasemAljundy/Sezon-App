import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  late List<dynamic> users;
  final formKey = GlobalKey<FormState>();
  final editController = TextEditingController();
  final tabIndex = 0.obs;
  RxBool isLoading = false.obs;
  List<Map<String, dynamic>> categoriesList = [];
  List<Map<String, dynamic>> productsList = [];

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  String changeTabTitle() {
    if (tabIndex.value == 0) {
      return 'الرئيسية';
    } else if (tabIndex.value == 1) {
      return 'الفئات';
    } else if (tabIndex.value == 2) {
      return 'طلباتي';
    } else if (tabIndex.value == 3) {
      return 'المفضلة';
    }
    return 'بدون عنوان';
  }

  Future<List<Map<String, dynamic>>> getCategoriesList() async {
    isLoading.value = true;
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('categories').get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> categoryData =
        (documentSnapshot.data() as Map<String, dynamic>);
        categoriesList.add(categoryData);
        isLoading.value = false;
      }
    } catch (e) {
      Logger().e(e);
    }
    return categoriesList;
  }

  Future<List<Map<String, dynamic>>> getProductsList() async {
    isLoading.value = true;
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('products').get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> productData =
        (documentSnapshot.data() as Map<String, dynamic>);
        productsList.add(productData);
        isLoading.value = false;
      }
    } catch (e) {
      Logger().e(e);
    }
    return productsList;
  }

  @override
  void onInit() {
    getCategoriesList();
    getProductsList();
    super.onInit();
  }
}
