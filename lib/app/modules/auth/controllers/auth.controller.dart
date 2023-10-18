import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () async {
      Get.offAndToNamed(AppRoutes.HOME);
    });
    super.onInit();
  }
}
