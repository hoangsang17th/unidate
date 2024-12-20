import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../dashboard/dashboard.controller.dart';
import '../profile.provider.dart';

class UpdateBioController extends GetxController {
  final ProfileProviders _profileProviders = ProfileProviders();
  final TextEditingController bioController = TextEditingController();

  bool isSubmitted = false;

  Rx<bool> isUpdateFromSetup = false.obs;

  @override
  void onInit() {
    super.onInit();
    isUpdateFromSetup.value = Get.arguments == null;
    bioController.text = Get.arguments ?? '';
  }

  Future<void> onUpdateBio() async {
    if (bioController.text.isEmpty) {
      Get.snackbar('Error', 'Bio cannot be empty');
      return;
    }
    try {
      if (isSubmitted) return;
      isSubmitted = true;
      EasyLoading.show(status: 'Updating bio...');
      final res = await _profileProviders.updateBio(bioController.text);
      if (isUpdateFromSetup.isTrue) {
        res.nextStep.navigation();
      } else {
        DashBoardController.to.user?.bio = bioController.text;

        Get.back();
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    EasyLoading.dismiss();
    isSubmitted = false;
  }
}
