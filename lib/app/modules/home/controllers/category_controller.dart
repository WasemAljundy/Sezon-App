import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';


class CategoryController extends GetxController {

  final RxInt tabIndex = 0.obs;
  RxString selectedCategory = 'accessories'.obs;
  RxBool isLoading = false.obs;
  List<Map<String, dynamic>> categoriesList = [];
  RxList productsList = [].obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  int getSelectedIndex() {
    return tabIndex.value;
  }

  String castingCategoryName() {
    if (selectedCategory.value == 'اكسسوارات') {
      return 'accessories';
    } else if (selectedCategory.value == 'المطرزات') {
      return 'embroideries';
    } else if (selectedCategory.value == 'الخزف') {
      return 'porcelain';
    } else if (selectedCategory.value == 'خشبيات') {
      return 'wooden';
    } else if (selectedCategory.value == 'الأكاليل') {
      return 'wreaths';
    }
    return 'no data';
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
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where('category_name', isEqualTo: castingCategoryName())
          .get();

      List<Map<String, dynamic>> productsList = [];

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> productData =
        (documentSnapshot.data() as Map<String, dynamic>);
        productsList.add(productData);
      }
      isLoading.value = false;
      return productsList;
    } catch (e) {
      Logger().e(e);
      isLoading.value = false;
      return [];
    }
  }

  Future<void> fetchProducts() async {
    List<Map<String, dynamic>> productList = await getProductsList();
    productsList.value = productList;
  }


  @override
  void onInit() {
    getCategoriesList();
    fetchProducts();
    super.onInit();
  }
}
