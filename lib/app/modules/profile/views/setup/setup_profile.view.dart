import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/values/app_colors.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/image.dart';
import '../../../../core/widgets/spacer.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/update_profile.controller.dart';
import '../../enums.dart';
import 'update_bio.view.dart';

class SetupProfileView extends GetView<UpdateProfileController> {
  const SetupProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateProfileController>(builder: (context) {
      return Scaffold(
        backgroundColor: const Color(0xFF99C4C2),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const VSpacer(25),
                      const SetepNumber(2),
                      const VSpacer(56),
                      AppSvgPicture(AppAssets.images.setup.profile),
                      const VSpacer(24),
                      // Date Picker
                      AppInput(
                        placeHolder: '20/09/2001 ',
                        label: 'When\'s your Birthday',
                        enabled: false,
                        controller: controller.birthdayController,
                        onTap: controller.updateBirthday,
                      ),
                      AppInput(
                        placeHolder: 'Enter ',
                        label: 'Your gender',
                        enabled: false,
                        controller: controller.genderController,
                        onTap: () => onChangedLookingFor(
                          (item) => controller.updateGender(item),
                          controller.user.gender != null
                              ? [controller.user.gender!]
                              : [],
                        ),
                      ),
                      // Bottomsheet
                      AppInput(
                        placeHolder: 'Enter ',
                        label: 'When\'s your hoping to find',
                        enabled: false,
                        controller: controller.lookingForController,
                        onTap: () => onChangedLookingFor(
                          (item) => controller.updateLookingFor(item),
                          controller.user.whoWantToDate,
                        ),
                      ),
                      AppInput(
                        placeHolder: '180',
                        label: 'Your height',
                        keyboardType: TextInputType.number,
                        onChanged: (p0) => {
                          debugPrint(p0),
                          controller.updateHeight(int.tryParse(p0) ?? 0),
                        },
                      ),
                      AppInput(
                        placeHolder: '60',
                        label: 'Your weight',
                        keyboardType: TextInputType.number,
                        onChanged: (p0) {
                          controller.updateWeight(int.tryParse(p0) ?? 0);
                        },
                      ),
                      AppInput(
                        placeHolder: 'Enter your name',
                        label: 'Education',
                        enabled: false,
                        controller: controller.educationController,
                        onTap: onChangedEducation,
                      ),
                    ],
                  ),
                ),
              ),
              const VSpacer(16),
              PrimaryButton(
                onPressed: controller.onUpdateProfile,
                text: 'Next step',
              ),
            ],
          ),
        ),
      );
    });
  }

  void onChangedLookingFor(
    Function(GenderEnum) updateLookingFor,
    List<GenderEnum> selectedLookingFor,
  ) {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.4,
        decoration: BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Who are you looking for?',
              style: AppTextStyles.h6,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const VSpacer(12),
            Text(
              'Select one or more',
              style: AppTextStyles.body2,
            ),
            const VSpacer(12),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final item = GenderEnum.values[index];
                  return ListTile(
                    title: Text(item.name),
                    selected: selectedLookingFor.contains(item),
                    onTap: () {
                      updateLookingFor(item);
                      Get.back();
                    },
                  );
                },
                itemCount: GenderEnum.values.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onChangedEducation() {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.7,
        decoration: BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Education',
              style: AppTextStyles.h6,
            ),
            const VSpacer(12),
            Text(
              'Select your education level',
              style: AppTextStyles.body2,
            ),
            const VSpacer(12),
            Expanded(
              child: ListView.builder(
                primary: false,
                itemBuilder: (context, index) {
                  final item = AcademicLevelEnum.values[index];
                  return ListTile(
                    title: Text(item.name),
                    selected: controller.user.education == item,
                    onTap: () {
                      controller.updateEducation(item);
                      Get.back();
                    },
                  );
                },
                itemCount: AcademicLevelEnum.values.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
