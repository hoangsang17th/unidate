import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';
import 'package:unidate/app/core/widgets/button.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:unidate/app/modules/profile/views/setup/update_bio.view.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/generated/assets.gen.dart';

class RequestLocationView extends StatelessWidget {
  const RequestLocationView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const SetepNumber(5),
                    const VSpacer(56),
                    AppSvgPicture(AppAssets.images.setup.location),
                    const VSpacer(24),
                    Text(
                      'We need your location to find people near you',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h6,
                    ),
                    const VSpacer(32),
                    SecondaryButton(
                      onPressed: () {},
                      text: 'Allow location access',
                    ),
                  ],
                ),
              ),
            ),
            const VSpacer(16),
            PrimaryButton(
              onPressed: () => Get.toNamed(AppRoutes.DASHBOARD),
              text: 'DONE',
            ),
          ],
        ),
      ),
    );
  }
}
