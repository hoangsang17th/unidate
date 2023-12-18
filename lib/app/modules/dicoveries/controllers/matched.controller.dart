import 'package:get/get.dart';
import 'package:unidate/app/modules/auth/entities/user.entity.dart';
import 'package:unidate/app/modules/dashboard/dashboard.controller.dart';
import 'package:unidate/app/modules/dicoveries/entities/discovery.entity.dart';

class MatchedController extends GetxController {
  CurrentUserEntity get user => DashBoardController.to.user!;

  late MatchUserEntity userMatched;
  @override
  void onInit() {
    super.onInit();
    userMatched = Get.arguments;
  }

  void onSayHello() {
    Get.toNamed('/chat', arguments: userMatched);
  }

  void onKeepSwiping() => Get.back();
}
