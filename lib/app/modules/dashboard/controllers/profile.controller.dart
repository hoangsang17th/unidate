import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/utils/get.storage.dart';
import 'package:unidate/app/data/entities/user.entity.dart';
import 'package:unidate/app/modules/dashboard/controllers/dashboard.controller.dart';
import 'package:unidate/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  CurrentUserEntity? get user => DashBoardController.to.user;

  Future<void> logout() async {
    try {
      EasyLoading.show(status: 'Loading...');
      AppGetStorage.instance.deleteAll();
      Get.offAllNamed(AppRoutes.WELCOME);
      EasyLoading.dismiss();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
