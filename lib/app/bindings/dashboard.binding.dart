import 'package:get/get.dart';
import 'package:unidate/app/modules/dashboard/controllers/dashboard.controller.dart';

import '../modules/dashboard/controllers/home.controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashBoardController());
    Get.put(HomeController());
  }
}
