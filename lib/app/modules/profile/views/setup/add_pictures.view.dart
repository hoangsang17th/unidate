import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';
import 'package:unidate/app/core/widgets/button.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:unidate/app/modules/profile/views/setup/setup_profile.view.dart';
import 'package:unidate/app/modules/profile/views/setup/update_bio.view.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/generated/assets.gen.dart';

class AddPicturesView extends StatefulWidget {
  const AddPicturesView({super.key});

  @override
  _AddPicturesViewState createState() => _AddPicturesViewState();
}

class _AddPicturesViewState extends State<AddPicturesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDE5B7),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const VSpacer(25),
                    const SetepNumber(4),
                    const VSpacer(56),
                    AppSvgPicture(AppAssets.images.setup.pictures),
                    const VSpacer(24),
                    Text(
                      'Add some pictures to your profile',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h6,
                    ),
                    const VSpacer(16),
                    const Row(
                      children: [
                        Expanded(child: AvatarPicker()),
                        HSpacer(8),
                        Expanded(child: AvatarPicker()),
                        HSpacer(8),
                        Expanded(child: AvatarPicker()),
                      ],
                    ),
                    const VSpacer(8),
                    const Row(
                      children: [
                        Expanded(child: AvatarPicker()),
                        HSpacer(8),
                        Expanded(child: AvatarPicker()),
                        HSpacer(8),
                        Expanded(child: AvatarPicker()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            PrimaryButton(
              onPressed: () => Get.toNamed(AppRoutes.SETUP_LOCATION),
              text: 'Next step',
            ),
          ],
        ),
      ),
    );
  }
}
