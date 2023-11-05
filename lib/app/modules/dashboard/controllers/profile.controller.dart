import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/utils/get.storage.dart';
import 'package:unidate/app/data/entities/user.entity.dart';
import 'package:unidate/app/data/providers/user.provider.dart';
import 'package:unidate/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final UserProviders _userProviders = UserProviders();

  RxBool isLoading = true.obs;

  final Rxn<CurrentUserEntity> _user = Rxn();
  CurrentUserEntity? get user => _user.value;

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

  Future<void> logout() async {
    try {
      EasyLoading.show(status: 'Loading...');
      AppGetStorage.instance.deleteAll();
      Get.offAllNamed(AppRoutes.WELCOME);
      EasyLoading.dismiss();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
