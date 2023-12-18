import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/utils/get.storage.dart';
import 'package:unidate/app/modules/auth/entities/user.entity.dart';
import 'package:unidate/app/modules/auth/user.provider.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/generated/assets.gen.dart';

class DashBoardController extends GetxController {
  final UserProviders _userProviders = UserProviders();

  RxBool isLoading = true.obs;

  final Rxn<CurrentUserEntity> _user = Rxn();
  CurrentUserEntity? get user => _user.value;

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

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    try {
      _user.value = await _userProviders.currentUser();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
