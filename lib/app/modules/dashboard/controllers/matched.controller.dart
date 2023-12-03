import 'package:get/get.dart';
import 'package:unidate/app/data/entities/match.entity.dart';
import 'package:unidate/app/data/entities/user.entity.dart';
import 'package:unidate/app/modules/dashboard/controllers/dashboard.controller.dart';

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

  void onKeepSwiping() {
    Get.back();
  }
}
