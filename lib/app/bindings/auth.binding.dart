import 'package:get/get.dart';
import 'package:unidate/app/modules/auth/controllers/login.controller.dart';


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>LoginController());
  }
}
