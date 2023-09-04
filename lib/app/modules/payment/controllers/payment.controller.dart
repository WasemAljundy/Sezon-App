import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/data/models/payment_method.dart';

class PaymentController extends GetxController {
  final methods = <PaymentMethod>[
    PaymentMethod(
      'بطاقة فيزا',
      'https://globalvisacards.com/yfoarist/2021/07/visa-card-logo.png',
      false,
    ),
    PaymentMethod(
      'بطاقة ماستركاترد',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/MasterCard_Logo.svg/2560px-MasterCard_Logo.svg.png',
      false,
    ),
    PaymentMethod(
      'نحويل بنكي',
      'https://e7.pngegg.com/pngimages/279/210/png-clipart-wire-transfer-bank-account-payment-money-bank-angle-service-thumbnail.png',
      false,
    ),
  ].obs;

  final RxInt selectedIndex = 0.obs;

  void toggleSelection(int index) {
    selectedIndex.value = index;
  }

  void bottomSheet(BuildContext context, dynamic widget) {
    showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => widget,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
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
