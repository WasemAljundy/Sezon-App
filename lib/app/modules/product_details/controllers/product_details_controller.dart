import 'package:get/get.dart';

class ProductDetailsController extends GetxController {

  RxInt photoIndex = 0.obs;
  RxInt productIndex = 0.obs;
  RxBool isFavourite = false.obs;

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

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

}