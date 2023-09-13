import 'package:get/get.dart';
import 'package:sezon_app/app/data/repositories/user/auth/auth_repository.dart';


class RegisterCodeController extends GetxController {

  late String smsCode;

  late final AuthRepository _authRepository = Get.find<AuthRepository>();

  void getMobileNumber() {
    _authRepository.getMobileNumber();
  }

  void sendVerificationCode() {
    _authRepository.sendVerificationCode();
  }

  void verifyCode() {
    _authRepository.verifyCode(smsCode);
  }


  @override
  void onInit() {
    getMobileNumber();
    sendVerificationCode();
    super.onInit();
  }

}
