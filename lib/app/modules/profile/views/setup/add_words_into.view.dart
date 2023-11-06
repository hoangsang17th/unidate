import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/widgets/button.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:unidate/app/modules/profile/views/setup/update_bio.view.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/generated/assets.gen.dart';

class AddWordsIntoView extends StatelessWidget {
  const AddWordsIntoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFDCD0),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const VSpacer(25),
                    const SetepNumber(3),
                    const VSpacer(56),
                    AppSvgPicture(AppAssets.images.setup.wordsInto),
                    const VSpacer(24),
                  ],
                ),
              ),
            ),
            PrimaryButton(
              onPressed: () => Get.toNamed(AppRoutes.SETUP_PICTURES),
              text: 'Next step',
            ),
          ],
        ),
      ),
    );
  }
}
