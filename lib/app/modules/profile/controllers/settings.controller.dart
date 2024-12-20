import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/utils/get.storage.dart';
import 'package:unidate/app/modules/auth/entities/user.entity.dart';
import 'package:unidate/app/modules/auth/user.provider.dart';
import 'package:unidate/app/modules/dashboard/dashboard.controller.dart';
import 'package:unidate/app/routes/app_pages.dart';

class SettingsController extends GetxController {
  DashBoardController get controller => DashBoardController.to;
  UserProviders userProviders = UserProviders();

  CurrentUserEntity? get user => controller.user;

  Future<void> logout() async {
    EasyLoading.show(status: 'Loading...');
    try {
      controller.ws?.disconnect();
    } catch (e) {
      debugPrint(e.toString());
    }
    AppGetStorage.instance.deleteAll();
    Get.offAllNamed(AppRoutes.WELCOME);
    EasyLoading.dismiss();
  }

  Future<void> requestVerify() async {
    EasyLoading.show(status: 'Loading...');
    try {
      await userProviders.requestVerify();
      EasyLoading.showSuccess('Request sent');
      return;
    } catch (e) {
      EasyLoading.showError(
          'You have sent the previous authentication request');
      rethrow;
    }
  }
}
