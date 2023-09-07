import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:sezon_app/app/components/custom_snackbar.dart';
import 'package:sezon_app/utils/colors.dart';

class UserProfileController extends GetxController {
  late TextEditingController userNameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController mobileController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final RxBool passwordText = true.obs;
  final ImagePicker imagePicker = ImagePicker();
  final RxBool isOval = false.obs;
  XFile? pickedFile;
  Rx<XFile?> pickedFileRx = Rx<XFile?>(null);

  void toggleClipOval() {
    isOval.value = !isOval.value;
  }

  void selectPicture() {
    Dialogs.materialDialog(
      context: Get.context!,
      title: 'اختر صورة',
      msg: 'حدد من اين تفضل اختيار الصورة',
      titleStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      msgStyle: TextStyle(
        fontSize: 17.sp,
      ),
      actions: [
        IconsOutlineButton(
          onPressed: () async => await pickImageCamera(),
          text: 'الكاميرا',
          iconData: CupertinoIcons.camera_fill,
          textStyle: const TextStyle(color: Colors.white),
          color: AppColors.customRed,
          iconColor: Colors.white,
        ),
        IconsButton(
          onPressed: () async => await pickImageGallery(),
          text: 'الاستديو',
          iconData: CupertinoIcons.photo_on_rectangle,
          color: AppColors.customRed,
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ],
    );
  }

  Future<void> pickImageGallery() async {
    XFile? imageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (imageFile != null) {
      pickedFile = imageFile;
      pickedFileRx.value = imageFile;
      toggleClipOval();
      Get.back();
    }
  }

  Future<void> pickImageCamera() async {
    XFile? imageFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    if (imageFile != null) {
      pickedFile = imageFile;
      pickedFileRx.value = imageFile;
      toggleClipOval();
      Get.back();
    }
  }

  bool checkData() {
    if (userNameController.text.isNotEmpty &&
        mobileController.text.isNotEmpty &&
        pickedFile != null) {
      return true;
    } else {
      CustomSnackBar.showCustomErrorSnackBar(
        title: "لا يمكن تركه فارغاً",
        message: 'الرجاء ادخال البيانات المطلوبة',
      );
      return false;
    }
  }

  void passwordVisibility() {
    passwordText.value = !passwordText.value;
  }

  Future<void> updateUser() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .set({
      'username': '${userNameController.text}@email.com',
      'Password': passwordController.text,
      'mobile': mobileController.text,
    });
  }

  Future<void> performUpdate() async {
    if (checkData()) {
      await updateUser();
      await uploadImage(path: pickedFileRx.value!.path).listen((event) {
        if (event.state == TaskState.error) {
          CustomSnackBar.showCustomSnackBar(
            title: 'حدث خطأ',
            message: 'لم يتم رفع الصورة الشخصية يرجى اعادة المحاولة',
          );
        }
      });
      clearTextFields();
      CustomSnackBar.showCustomSnackBar(
        title: 'تمت بنجاح',
        message: 'تم تعديل معلوماتك الشخصية ',
      );
    }
  }

  Future<List<Reference>> read() async {
    ListResult listResult = await _firebaseStorage.ref('images').listAll();
    if (listResult.items.isNotEmpty) {
      return listResult.items;
    }
    return [];
  }

  Future<bool> delete({required String path}) {
    return _firebaseStorage
        .ref(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Stream<TaskSnapshot> uploadImage({required String path}) async* {
    List<Reference> oldImages = await read();
    for (final reference in oldImages) {
      await delete(path: reference.fullPath);
    }
    UploadTask uploadTask = _firebaseStorage
        .ref('images/${DateTime.now()}_image')
        .putFile(File(path));
    yield* uploadTask.snapshotEvents;
  }

  void clearTextFields() {
    userNameController.text = '';
    passwordController.text = '';
    mobileController.text = '';
  }

  @override
  void onInit() {
    read();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
