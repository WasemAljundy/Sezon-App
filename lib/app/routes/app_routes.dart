part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const INITIAL = _Paths.INITIAL;
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const REGISTER_CODE = _Paths.REGISTER_CODE;
  static const PRODUCT_DETAILS = _Paths.PRODUCT_DETAILS;
  static const PAYMENT = _Paths.PAYMENT;
  static const PAYMENT_CONFIRMATION = _Paths.PAYMENT_CONFIRMATION;
  static const NOTIFICATION = _Paths.NOTIFICATION;
  static const USER_PROFILE = _Paths.USER_PROFILE;

  static const ADMIN_ADD_PRODUCTS = _Paths.ADMIN_ADD_PRODUCTS;
}

abstract class _Paths {
  _Paths._();
  static const INITIAL = '/initial';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const REGISTER_CODE = '/register_code';
  static const PRODUCT_DETAILS = '/product_details';
  static const PAYMENT = '/payment';
  static const PAYMENT_CONFIRMATION = '/payment_confirmation';
  static const NOTIFICATION = '/notification';
  static const USER_PROFILE = '/user_profile';
  static const ADMIN_ADD_PRODUCTS = '/admin_add_product';
}
