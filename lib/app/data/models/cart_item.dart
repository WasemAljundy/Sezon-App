class CartItem {
  late String product_name;
  late String product_description;
  late String product_price;
  late String product_image;
  late String category_name;

  CartItem();


  CartItem.fromMap(Map<String, dynamic> documentMap) {
    product_name = documentMap['product_name'];
    product_description = documentMap['product_description'];
    product_price = documentMap['product_price'];
    product_image = documentMap['product_image'];
    category_name = documentMap['category_name'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic> {};
    map['product_name'] = product_name;
    map['product_description'] = product_description;
    map['product_price'] = product_price;
    map['product_image'] = product_image;
    map['category_name'] = category_name;
    return map;
  }
}
