import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    Get.offAndToNamed(AppRoutes.HOME);

    super.onInit();
  }
}
