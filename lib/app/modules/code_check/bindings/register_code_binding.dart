import 'package:get/get.dart';
import 'package:sezon_app/app/data/repositories/user/auth/auth_repository.dart';
import 'package:sezon_app/app/modules/code_check/controllers/register_code_controller.dart';

class RegisterCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterCodeController>(
      () => RegisterCodeController(),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );
  }
}
