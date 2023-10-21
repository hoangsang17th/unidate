import 'package:get/get.dart';
import '../modules/auth/controllers/manager.controller.dart';

class ManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ManagerController());
  }
}
