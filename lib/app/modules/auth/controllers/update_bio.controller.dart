import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:unidate/app/modules/auth/profile.provider.dart';

class UpdateBioController extends GetxController {
  final ProfileProviders _profileProviders = ProfileProviders();

  final RxString _newBio = ''.obs;
  String get newBio => _newBio.value;

  bool isSubmitted = false;

  void setNewBio(String value) {
    _newBio.value = value;
  }

  Future<void> onUpdateBio() async {
    if (newBio.isEmpty) {
      Get.snackbar('Error', 'Bio cannot be empty');
      return;
    }
    try {
      if (isSubmitted) return;
      isSubmitted = true;
      EasyLoading.show(status: 'Updating bio...');
      final res = await _profileProviders.updateBio(newBio);

      res.nextStep.navigation();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    EasyLoading.dismiss();
    isSubmitted = false;
  }
}
