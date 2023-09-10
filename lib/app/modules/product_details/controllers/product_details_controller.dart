import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

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
      CollectionReference collection = FirebaseFirestore.instance.collection('products');

      QuerySnapshot querySnapshot = await collection.where('product_name', isEqualTo: name).get();

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
      Logger().w('Document data: ${document.data()}');
    } else {
      Logger().e('Document not found');
    }
  }


  @override
  void onInit() async {
    await fetchProduct();
    super.onInit();
  }


}