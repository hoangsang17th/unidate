// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unidate/app/routes/app_pages.dart';

@JsonEnum()
enum UserStepSetup {
  Bio,
  Profile,
  Pictures,
  WordInto,
  Location,

  Done;

  void navigation() {
    switch (this) {
      case Bio:
        Get.offAllNamed(AppRoutes.SETUP_BIO);

        break;
      case Profile:
        Get.offAllNamed(AppRoutes.SETUP_PROFILE);

        break;
      case Pictures:
        Get.offAllNamed(AppRoutes.SETUP_PICTURES);

        break;
      case Location:
        Get.offAllNamed(AppRoutes.SETUP_LOCATION);

        break;
      case WordInto:
        Get.offAllNamed(AppRoutes.SETUP_WORDSINTO);

        break;
      default:
        Get.offAllNamed(AppRoutes.DASHBOARD);
    }
  }
}