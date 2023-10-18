import 'package:get/get.dart';

import '../controllers/auth.controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
