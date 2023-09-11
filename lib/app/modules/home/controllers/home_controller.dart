import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sezon_app/app/components/custom_snackbar.dart';

class HomeController extends GetxController {
  late List<dynamic> users;
  final formKey = GlobalKey<FormState>();
  final editController = TextEditingController();
  final tabIndex = 0.obs;
  var product;
  RxString selectedProduct = ''.obs;
  RxBool isLoading = false.obs;
  List<Map<String, dynamic>> categoriesList = [];
  RxList<dynamic> productsList = [].obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void setFavouriteProduct(String product_name) {
    selectedProduct.value = product_name;
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

  Future<RxList> getProductsList() async {
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

  Future<DocumentSnapshot?> getProductByName() async {
    isLoading.value = true;
    try {
      CollectionReference collection =
      FirebaseFirestore.instance.collection('products');

      QuerySnapshot querySnapshot =
      await collection.where('product_name', isEqualTo: selectedProduct.value).get();

      if (querySnapshot.docs.isNotEmpty) {
        isLoading.value = false;
        return querySnapshot.docs.first;
      } else {
        return null;
      }
    } catch (e) {
      Logger().e(e);
      isLoading.value = false;
      return null;
    }
  }

  fetchProduct() async {
    isLoading.value = true;
    DocumentSnapshot? document = await getProductByName();
    if (document != null) {
      product = document.data();
      isLoading.value = false;
    } else {
      Logger().e('Document not found');
    }
  }

  void addProductToFavourites() async {
    isLoading.value = true;
    var userId = FirebaseAuth.instance.currentUser!.uid;

    if (product != null) {
      final productName = product['product_name'];

      try {
        // Query the "products" collection to find the product by its name
        final productQuery = await FirebaseFirestore.instance
            .collection('products')
            .where('product_name', isEqualTo: productName)
            .get();

        if (productQuery.docs.isNotEmpty) {
          // Get the product document reference
          final productDocRef = productQuery.docs.first.reference;

          // Update the 'is_favourite' field in the 'products' collection
          await productDocRef.update({
            'is_favourite': true,
          });

          // Update the is_favourite property in productsList
          final productIndex = productsList.indexWhere(
                (product) => product['product_name'] == productName,
          );
          if (productIndex != -1) {
            productsList[productIndex]['is_favourite'] = true;
          }

          // Add the product to the 'user_favourites' collection
          final cartRef = FirebaseFirestore.instance
              .collection('user_favourites')
              .doc(userId);

          await cartRef.set({
            'favouriteItems': FieldValue.arrayUnion([
              {
                'product_name': productName,
                'product_description': product['product_description'],
                'product_price': product['product_price'],
                'product_image': product['product_image'],
                'category_name': product['category_name'],
                'is_favourite': true,
              }
            ])
          }, SetOptions(merge: true));

          isLoading.value = false;

          CustomSnackBar.showCustomSnackBar(
            title: 'تمت الاضافة بنجاح',
            message: 'تم اضافة هذا المنتج الى المفضلات ❤️',
          );
        } else {
          // Handle the case where the product with the given name doesn't exist
          CustomSnackBar.showCustomErrorSnackBar(
            title: 'المنتج غير موجود',
            message: 'عذرًا، المنتج الذي تحاول اضافته غير موجود في قاعدة البيانات.',
          );
        }
      } catch (e) {
        CustomSnackBar.showCustomErrorSnackBar(
          title: 'حدث خطأ ما',
          message: 'لم تنجح عملية الاضافة ، يرجى اعادة المحاولة 🙁',
        );
        print('Error: $e');
      }
    } else {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'حدث خطأ ما',
        message: 'لم تنجح عملية الاضافة ، يرجى اعادة المحاولة 🙁',
      );
    }
  }





  void performFavourite(String product_name) async {
    setFavouriteProduct(product_name);
    await fetchProduct();
    addProductToFavourites();
  }


  @override
  void onInit() {
    getCategoriesList();
    getProductsList();
    super.onInit();
  }
}
