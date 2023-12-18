import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unidate/app/modules/auth/entities/user.entity.dart';
import 'package:unidate/app/modules/auth/profile.provider.dart';
import 'package:unidate/app/modules/profile/enums.dart';

class UpdateProfileController extends GetxController {
  final ProfileProviders _profileProviders = ProfileProviders();

  final Rx<UpdateProfileEntity> _user = UpdateProfileEntity().obs;
  UpdateProfileEntity get user => _user.value;

  TextEditingController birthdayController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController lookingForController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  bool isSubmitted = false;

  @override
  void onInit() {
    super.onInit();
    educationController.text = user.education.name;
  }

  Future<void> updateBirthday() async {
    final date = await showDatePicker(
      context: Get.context!,
      initialDate:
          user.birthday ?? DateTime.now().add(const Duration(days: -365 * 20)),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (date == null) {
      if (user.birthday == null) {
        Get.snackbar('Error', 'Please select a date');
      }
    } else {
      birthdayController.text = DateFormat('dd/MM/yyyy').format(date);
      _user.value.birthday = date;
    }
  }

  void updateGender(GenderEnum gender) {
    _user.value.gender = gender;
    genderController.text = gender.name.capitalizeFirst ?? "";
  }

  void updateLookingFor(GenderEnum lookingFor) {
    if (user.whoWantToDate.contains(lookingFor)) {
      user.whoWantToDate.remove(lookingFor);
    } else {
      user.whoWantToDate = [...user.whoWantToDate, lookingFor];
    }
    lookingForController.text = user.whoWantToDate
        .map((e) => e.name.capitalizeFirst)
        .toList()
        .join(', ');
    _user.refresh();
  }

  void updateHeight(int height) {
    if (height < 100 || height > 250) {
      Get.snackbar('Error', 'Height must be between 100 and 250');
      return;
    }
    _user.value.tall = height;
  }

  void updateWeight(int weight) {
    _user.value.weight = weight;
  }

  void updateEducation(AcademicLevelEnum education) {
    try {
      _user.value.education = education;
      educationController.text = education.name;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> onUpdateProfile() async {
    if (isSubmitted) return;
    if (!user.isValid) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }

    isSubmitted = true;
    try {
      EasyLoading.show(status: 'Updating profile...');
      final res = await _profileProviders.updateProfile(user);
      res.nextStep.navigation();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    EasyLoading.dismiss();
    isSubmitted = false;
  }
}
