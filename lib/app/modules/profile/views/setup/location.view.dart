import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/image.dart';
import '../../../../core/widgets/spacer.dart';
import '../../../../routes/app_pages.dart';
import 'update_bio.view.dart';

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
