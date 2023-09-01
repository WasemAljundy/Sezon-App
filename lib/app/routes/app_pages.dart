import 'package:get/get.dart';
import 'package:sezon_app/app/modules/code_check/bindings/register_code_binding.dart';
import 'package:sezon_app/app/modules/code_check/views/register_code_view.dart';
import 'package:sezon_app/app/modules/home/views/main_view.dart';
import 'package:sezon_app/app/modules/launch_view.dart';
import 'package:sezon_app/app/modules/login/bindings/login_binding.dart';
import 'package:sezon_app/app/modules/login/views/login_view.dart';
import 'package:sezon_app/app/modules/register/bindings/register_binding.dart';
import 'package:sezon_app/app/modules/register/views/register_view.dart';
import '../modules/home/bindings/home_binding.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INITIAL;
  static const HOME = Routes.HOME;
  static const LOGIN = Routes.LOGIN;
  static const REGISTER = Routes.REGISTER;
  static const REGISTER_CODE = Routes.REGISTER_CODE;

  static final routes = [
    GetPage(
      name: _Paths.INITIAL,
      page: () => const LaunchView(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () =>  MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_CODE,
      page: () => const RegisterCodeView(),
      binding: RegisterCodeBinding(),
    ),
  ];
}
