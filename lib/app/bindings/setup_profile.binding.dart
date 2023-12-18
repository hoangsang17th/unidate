import 'package:get/get.dart';
import 'package:unidate/app/modules/auth/controllers/add_pictures.controller.dart';
import 'package:unidate/app/modules/auth/controllers/add_words_into.controller.dart';
import 'package:unidate/app/modules/auth/controllers/setup_location.controller.dart';
import 'package:unidate/app/modules/auth/controllers/update_profile.controller.dart';

import '../modules/auth/controllers/update_bio.controller.dart';

class SetupProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateBioController>(() => UpdateBioController());
    Get.lazyPut<UpdateProfileController>(() => UpdateProfileController());
    Get.lazyPut<SetupLocationController>(() => SetupLocationController());
    Get.lazyPut<AddPicturesController>(() => AddPicturesController());
    Get.lazyPut<AddWordsIntoController>(() => AddWordsIntoController());
  }
}