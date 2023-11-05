import 'package:get/get.dart';
import 'package:unidate/app/core/utils/get.storage.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/generated/assets.gen.dart';

class DashBoardController extends GetxController {
  static DashBoardController get to => Get.find();

  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int value) => _currentIndex.value = value;

  void onChangedTab(int index) {
    currentIndex = index;
  }

  final List<String> iconNavigations = [
    AppAssets.icons.navigationBar.home,
    AppAssets.icons.navigationBar.heart,
    AppAssets.icons.navigationBar.chat,
    AppAssets.icons.navigationBar.profile,
  ];

  Future<void> logout() async {
    await AppGetStorage.instance.deleteAll();
    Get.offAllNamed(AppRoutes.WELCOME);
  }
}
