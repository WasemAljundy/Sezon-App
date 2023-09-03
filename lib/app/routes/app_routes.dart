part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const INITIAL = _Paths.INITIAL;
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const REGISTER_CODE = _Paths.REGISTER_CODE;
  static const PRODUCT_DETAILS = _Paths.PRODUCT_DETAILS;
}

abstract class _Paths {
  _Paths._();
  static const INITIAL = '/initial';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const REGISTER_CODE = '/register_code';
  static const PRODUCT_DETAILS = '/product_details';
}
