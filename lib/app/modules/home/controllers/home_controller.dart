import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sezon_app/app/data/models/user.dart';
import 'package:sezon_app/app/services/api_call_status.dart';
import 'package:sezon_app/app/services/base_client.dart';
import 'package:sezon_app/utils/constants.dart';

class HomeController extends GetxController {

  late List<dynamic> users;
  final formKey = GlobalKey<FormState>();
  final editController = TextEditingController();
  final tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  String changeTabTitle() {
    if (tabIndex.value == 0) {
      return 'الرئيسية';
    } else if (tabIndex.value == 1) {
      return 'الفئات';
    } else if (tabIndex.value == 2) {
      return 'طلباتي';
    } else if (tabIndex.value == 3) {
      return 'المفضلة';
    }
    return 'بدون عنوان';
  }

  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  getUsers() async {
    await BaseClient.safeApiCall(
      Constants.users,
      RequestType.get,
      onLoading: () {
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        var array = response.data['data'];
        Logger().i(array.runtimeType);
        users = array.map((jsonObject) => User.fromJson(jsonObject)).toList();
        apiCallStatus = ApiCallStatus.success;
        update();
        return users;
      },
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }

  getUserBySearch(String name) async {
    await BaseClient.safeApiCall(
      Constants.searchUser,
      RequestType.post,
      queryParameters: {'first_name': name},
      onSuccess: (response) {
        var array = response.data['data'];
        Logger().i(array.runtimeType);
        users = array.map((jsonObject) => User.fromJson(jsonObject)).toList();
        apiCallStatus = ApiCallStatus.success;
        update();
        return users;
      },
      onError: (error) {
        if (name.isEmpty) {
          return users;
        }
        update();
      },
    );
  }

  @override
  void onInit() {
    // getUsers();
    super.onInit();
  }
}
