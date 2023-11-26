import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/utils/get.storage.dart';
import 'package:unidate/app/data/entities/user.entity.dart';
import 'package:unidate/app/data/providers/user.provider.dart';
import 'package:unidate/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final UserProviders _userProviders = UserProviders();

  final Rx<LoginEntity> _user = LoginEntity().obs;
  LoginEntity get user => _user.value;

  RxBool isShowPassword = false.obs;

  bool isSubmitted = false;

  void setEmail(String email) {
    _user.update((val) {
      val!.email = email;
    });
  }

  void setPassword(String password) {
    _user.update((val) {
      val!.password = password;
    });
  }

  Future<void> onLogin() async {
    if (isSubmitted) return;

    isSubmitted = true;

    if (!user.isValid) {
      Get.snackbar('Error', 'Form is invalid');
    } else {
      EasyLoading.show(status: 'Waiting...');
      try {
        final res = await _userProviders.login(user);
        AppGetStorage.instance.write(
          AppGetKey.accessToken,
          res.accessToken,
        );
        res.nextStep.navigation();
      } catch (e) {
        Get.snackbar('Error', 'Đăng nhập thất bại');
        debugPrint(e.toString());
      }
    }
    EasyLoading.dismiss();
    isSubmitted = false;
  }

  void onRegister() {
    Get.back();
    Get.toNamed(AppRoutes.REGISTER);
  }

  void onChangedShowPassword() {
    isShowPassword.toggle();
  }
  
}
