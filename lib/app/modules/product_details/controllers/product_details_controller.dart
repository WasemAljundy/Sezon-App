import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sezon_app/app/components/custom_snackbar.dart';
import 'package:sezon_app/app/modules/home/controllers/shopping_controller.dart';

class ProductDetailsController extends GetxController {
  RxInt photoIndex = 0.obs;
  RxInt productIndex = 0.obs;
  RxBool isFavourite = false.obs;
  RxBool isLoading = false.obs;
  String selectedProduct = Get.arguments;
  var product;

  void changePage(int index) {
    photoIndex.value = index;
  }

  void selectFavouriteIndex(int index) {
    productIndex.value = index;
    isFavourite.value = !isFavourite.value;
  }

  int getSelectedIndex() {
    return productIndex.value;
  }

  Future<DocumentSnapshot?> getProductByName(String name) async {
    isLoading.value = true;
    try {
      CollectionReference collection =
          FirebaseFirestore.instance.collection('products');

      QuerySnapshot querySnapshot =
          await collection.where('product_name', isEqualTo: name).get();

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
    DocumentSnapshot? document = await getProductByName(selectedProduct);
    if (document != null) {
      product = document.data();
      isLoading.value = false;
    } else {
      Logger().e('Document not found');
    }
  }

  void addProductToCart() async {
    isLoading.value = true;
    var userId = FirebaseAuth.instance.currentUser!.uid;
    final cartRef =
        FirebaseFirestore.instance.collection('user_carts').doc(userId);
    if (product != null) {
      cartRef.set(
        {
          'cartItems': FieldValue.arrayUnion([
            {
              'product_name': product['product_name'],
              'product_description': product['product_description'],
              'product_price': product['product_price'],
              'product_image': product['product_image'],
              'category_name': product['category_name'],
              'is_favourite': false,
            }
          ])
        },
        SetOptions(
          merge: true,
        ),
      );
      isLoading.value = false;
      CustomSnackBar.showCustomSnackBar(
        title: 'تمت الاضافة بنجاح',
        message: 'تم اضافة هذا المنتج الى سلة الطلبات 😍',
      );
      Get.find<ShoppingController>().fetchCartItems();

    } else {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'حدث خطأ ما',
        message: 'لم تنجح عملية الاضافة ، يرجى اعادة المحاولة 🙁',
      );
    }
  }

  @override
  void onInit() async {
    await fetchProduct();
    super.onInit();
  }
}
