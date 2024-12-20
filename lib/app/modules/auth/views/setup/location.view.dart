import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/modules/auth/controllers/setup_location.controller.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/image.dart';
import '../../../../core/widgets/spacer.dart';
import '../../../../routes/app_pages.dart';
import 'update_bio.view.dart';

class RequestLocationView extends GetView<SetupLocationController> {
  const RequestLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetupLocationController>(builder: (context) {
      return Scaffold(
        backgroundColor: const Color(0xFFE3E3E3),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const VSpacer(25),
                      if (controller.isUpdateFromSetup.isTrue)
                        const SetepNumber(5),
                      const VSpacer(56),
                      AppSvgPicture(AppAssets.images.setup.location),
                      const VSpacer(24),
                      Text(
                        'We need your location to find people near you',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.h6,
                      ),
                      const VSpacer(16),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Receive notifications when someone is suitable for you within 10 km?',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                          Obx(
                            () => Switch(
                              value: controller.isAllowRealtimeLocation.value,
                              onChanged: controller.allowRealtimeLocation,
                              activeColor: AppColors.primary,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                            ),
                          )
                        ],
                      ),
                      const VSpacer(32),
                      SecondaryButton(
                        onPressed: controller.allowLocation,
                        text: 'Allow location access',
                      ),
                    ],
                  ),
                ),
              ),
              const VSpacer(16),
              if (controller.isUpdateFromSetup.isTrue)
                PrimaryButton(
                  onPressed: () => Get.toNamed(AppRoutes.DASHBOARD),
                  text: 'DONE',
                ),
            ],
          ),
        ),
      );
    });
  }
}
