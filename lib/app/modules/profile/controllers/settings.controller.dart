import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/utils/get.storage.dart';
import 'package:unidate/app/modules/auth/entities/user.entity.dart';
import 'package:unidate/app/modules/dashboard/dashboard.controller.dart';
import 'package:unidate/app/routes/app_pages.dart';

class SettingsController extends GetxController {
  DashBoardController get controller => DashBoardController.to;
  CurrentUserEntity? get user => controller.user;

  Future<void> logout() async {
    try {
      EasyLoading.show(status: 'Loading...');
      controller.ws?.disconnect();
      AppGetStorage.instance.deleteAll();
      Get.offAllNamed(AppRoutes.WELCOME);
      EasyLoading.dismiss();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
