import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sezon_app/app/data/models/cart_item.dart';

class ShoppingController extends GetxController {
  late TabController tabController;
  RxInt selectedIndex = 0.obs;
  final cartItems = [].obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  Future<void> fetchCartItems() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    try {
      final cartData = await FirebaseFirestore.instance
          .collection('user_carts')
          .doc(userId)
          .get();

      final cartItemsData = cartData.data()?['cartItems'] ?? [];
      cartItems.value =
          cartItemsData.map((itemData) => CartItem.fromMap(itemData)).toList();
    } catch (e) {
      Logger().e('Error fetching cart items: $e');
    }
  }

  void removeCartItem(String product_name) {
    final indexToRemove =
        cartItems.indexWhere((item) => item.product_name == product_name);

    if (indexToRemove != -1) {
      cartItems.removeAt(indexToRemove);
      updateFirestoreCart();
    }
  }

  void updateFirestoreCart() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    final cartRef =
        FirebaseFirestore.instance.collection('user_carts').doc(userId);
    try {
      await cartRef.set({
        'cartItems': cartItems.map((item) => item.toMap()).toList(),
      });
    } catch (e) {
      Logger().e('Error updating cart in Firestore: $e');
    }
  }

  @override
  void onInit() {
    fetchCartItems();
    super.onInit();
  }
}
