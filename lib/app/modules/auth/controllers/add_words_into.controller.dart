import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:unidate/app/modules/auth/entities/user.entity.dart';
import 'package:unidate/app/modules/auth/profile.provider.dart';
import 'package:unidate/app/modules/profile/enums.dart';

class AddWordsIntoController extends GetxController {
  final ProfileProviders _profileProviders = ProfileProviders();

  Rx<List<WordIntoEnum>> words = Rx<List<WordIntoEnum>>([]);

  bool isSubmitted = false;

  void onTapedWord(WordIntoEnum _) {
    if (words.value.contains(_)) {
      words.value.remove(_);
    } else {
      words.value.add(_);
    }
    words.refresh();
  }

  bool isWordSelected(WordIntoEnum _) {
    return words.value.contains(_);
  }

  Future<void> onSubmitted() async {
    if (words.value.length <= 5) {
      Get.snackbar('Miximun', 'Tối thiểu phải chọn 5 từ khoá');
      return;
    }
    if (isSubmitted) return;
    isSubmitted = true;

    try {
      EasyLoading.show(status: 'Loading...');
      final res = await _profileProviders.addWordsInto(WordIntoEntity(
        words: words.value,
      ));
      res.nextStep.navigation();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      EasyLoading.dismiss();
      isSubmitted = false;
    }
  }
}
