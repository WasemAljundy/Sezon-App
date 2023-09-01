part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const INITIAL = _Paths.INITIAL;
  static const HOME = _Paths.HOME;
  static const CATEGORY_HOME = _Paths.CATEGORY_HOME;
  static const SHOPPING_HOME = _Paths.SHOPPING_HOME;
  static const FAVOURITE_HOME = _Paths.FAVOURITE_HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const REGISTER_CODE = _Paths.REGISTER_CODE;
}

abstract class _Paths {
  _Paths._();
  static const INITIAL = '/initial';
  static const HOME = '/home';
  static const CATEGORY_HOME = '/home/category';
  static const SHOPPING_HOME = '/home/shopping';
  static const FAVOURITE_HOME = '/home/favourite';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const REGISTER_CODE = '/register_code';
}
