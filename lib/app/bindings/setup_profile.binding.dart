import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:unidate/app/modules/profile/controllers/add_pictures.controller.dart';
import 'package:unidate/app/modules/profile/controllers/add_words_into.controller.dart';
import 'package:unidate/app/modules/profile/controllers/setup_location.controller.dart';
import 'package:unidate/app/modules/profile/controllers/update_profile.controller.dart';

import '../modules/profile/controllers/update_bio.controller.dart';

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