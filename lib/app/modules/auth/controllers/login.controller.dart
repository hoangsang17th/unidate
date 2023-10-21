import 'package:get/get.dart';
import 'package:unidate/app/routes/app_pages.dart';

class LoginController extends GetxController {
  void onLogin() {
    Get.offAllNamed(AppRoutes.DASHBOARD);
  }

  void onRegister() {
    Get.back();
    Get.toNamed(AppRoutes.REGISTER);
  }
}
