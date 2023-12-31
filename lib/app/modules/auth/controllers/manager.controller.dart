import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ManagerController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.offAndToNamed(AppRoutes.WELCOME);
    });

    super.onInit();
  }
}
