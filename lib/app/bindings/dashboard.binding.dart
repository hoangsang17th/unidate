import 'package:get/get.dart';
import 'package:unidate/app/modules/conversations/controllers/conversation.controller.dart';
import 'package:unidate/app/modules/dashboard/dashboard.controller.dart';
import 'package:unidate/app/modules/profile/controllers/settings.controller.dart';

import '../modules/dicoveries/controllers/home.controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashBoardController());
    Get.lazyPut(
      () => MatchingController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ConversationController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SettingsController(),
      fenix: true,
    );
  }
}
