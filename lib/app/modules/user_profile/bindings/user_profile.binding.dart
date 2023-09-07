import 'package:get/get.dart';
import 'package:sezon_app/app/modules/user_profile/controllers/user_profile.controller.dart';

class UserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserProfileController>(
      UserProfileController(),
      permanent: true,
    );
  }
}
