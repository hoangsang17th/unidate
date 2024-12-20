import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';
import 'package:unidate/app/core/widgets/app_text_field.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:unidate/app/modules/dicoveries/controllers/setup_filter.controller.dart';
import 'package:unidate/app/modules/profile/views/settings.view.dart';
import 'package:unidate/app/modules/profile/enums.dart';

class SetupFilterView extends GetView<SetupFilterController> {
  const SetupFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<SetupFilterController>(
      init: Get.put(SetupFilterController()),
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.bg,
            elevation: 1,
            shadowColor: AppColors.divider,
            title: Text(
              'Setup Filter',
              style: AppTextStyles.h5,
            ),
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.close,
                color: AppColors.textPrimary,
              ),
            ),
            actions: [
              IconButton(
                onPressed:
                    controller.isCanApply ? controller.updateFilter : null,
                icon: Icon(
                  Icons.check,
                  color: controller.isCanApply
                      ? AppColors.primary
                      : AppColors.textPrimary,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What\'s your type?',
                  style: AppTextStyles.h4,
                ),
                const VSpacer(24),
                Text(
                  'Preferences help us personalize your daily batch in Suggested. Changes apply at noon',
                  style: AppTextStyles.body2,
                ),
                const VSpacer(24),
                if (controller.isLoading.isTrue) ...[
                  const AppShimmer(
                    height: 32,
                    width: 120,
                  ),
                  const VSpacer(16),
                  const AppShimmer(
                    height: 48,
                    width: 200,
                  ),
                ] else ...[
                  _buildTitle(
                    'Max Distance',
                    controller.filterRequired.onlyInDistance,
                    controller.onChangedOnlyInDistance,
                  ),
                  SfSlider(
                    min: 0,
                    max: 3000,
                    value: controller.filter.maxDistance,
                    interval: 1000,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: controller.onChangedDistance,
                    activeColor: AppColors.primary,
                    stepSize: 10,
                  ),
                  const VSpacer(24),
                  _buildTitle(
                    'Age',
                    controller.filterRequired.onlyInAge,
                    controller.onChangedOnlyInAge,
                  ),
                  const VSpacer(8),
                  _buildSubTitle(),
                  SfRangeSlider(
                    min: 17,
                    max: 100.0,
                    values: SfRangeValues(
                      controller.filter.ageFrom,
                      controller.filter.ageTo,
                    ),
                    interval: 13,
                    stepSize: 2,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: (SfRangeValues values) {
                      controller.onChangedAgeFrom(values.start);
                      controller.onChangedAgeTo(values.end);
                    },
                  ),
                  const VSpacer(24),
                  _buildTitle(
                    'Height',
                    controller.filterRequired.onlyInTall,
                    controller.onChangedOnlyInTall,
                  ),
                  const VSpacer(8),
                  _buildSubTitle(),
                  SfRangeSlider(
                    min: 140,
                    max: 200,
                    values: SfRangeValues(
                      controller.filter.tallFrom,
                      controller.filter.tallTo,
                    ),
                    interval: 20,
                    stepSize: 2,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: (SfRangeValues values) {
                      controller.onChangedTallFrom(values.start);
                      controller.onChangedTallTo(values.end);
                    },
                  ),
                  const VSpacer(24),
                  _buildTitle(
                    'Weight',
                    controller.filterRequired.onlyInWeight,
                    controller.onChangedOnlyInWeight,
                  ),
                  const VSpacer(8),
                  _buildSubTitle(),
                  SfRangeSlider(
                    min: 40,
                    max: 200,
                    values: SfRangeValues(
                      controller.filter.weightFrom,
                      controller.filter.weightTo,
                    ),
                    interval: 40,
                    stepSize: 2,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: (SfRangeValues values) {
                      controller.onChangedWeightFrom(values.start);
                      controller.onChangedWeightTo(values.end);
                    },
                  ),
                  const VSpacer(24),
                  _buildTitle(
                    'Education',
                    controller.filterRequired.onlyInEducation,
                    controller.onChangedOnlyInEducation,
                  ),
                  const VSpacer(8),
                  AppInput(
                    placeHolder: 'Enter ',
                    label: 'Your gender',
                    enabled: false,
                    controller: controller.genderController,
                    onTap: onChangedLookingFor,
                  ),
                  AppInput(
                    placeHolder: 'Enter your name',
                    label: 'Education',
                    enabled: false,
                    controller: controller.educationController,
                    onTap: onChangedEducation,
                  ),
                  const VSpacer(24),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  void onChangedLookingFor() {
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
                  return Obx(
                    () => ListTile(
                      title: Text(item.name),
                      selected: controller.filter.whoWantToDate.contains(item),
                      onTap: () {
                        controller.onChangedWhoWantToDate(item);
                      },
                    ),
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
              'Suitable for people with the same learning process as follows',
              style: AppTextStyles.body2,
            ),
            const VSpacer(12),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final item = AcademicLevelEnum.values[index];
                  return Obx(
                    () => ListTile(
                      title: Text(item.name),
                      selected: controller.filter.education.contains(item),
                      onTap: () {
                        controller.onChangedMatcherEducation(item);
                      },
                    ),
                  );
                },
                itemCount: AcademicLevelEnum.values.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildSubTitle() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'From',
            style: AppTextStyles.subtitle2,
          ),
        ),
        Expanded(
          child: Text(
            'To',
            style: AppTextStyles.subtitle2,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(String title, bool value, Function(bool) onChanged) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.subtitle1,
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary,
          materialTapTargetSize: MaterialTapTargetSize.padded,
        ),
      ],
    );
  }
}
