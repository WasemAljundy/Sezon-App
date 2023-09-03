import 'package:get/get.dart';


class CategoryController extends GetxController {

  final RxInt tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  int getSelectedIndex() {
    return tabIndex.value;
  }


  @override
  void onInit() {
    super.onInit();
  }
}
