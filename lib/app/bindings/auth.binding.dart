import 'package:get/get.dart';
import 'package:unidate/app/modules/auth/controllers/login.controller.dart';
import 'package:unidate/app/modules/auth/controllers/register.controller.dart';


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>LoginController());
    Get.lazyPut(() => RegisterController());
  }
}
