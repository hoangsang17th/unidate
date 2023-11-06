import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/widgets/app_text_field.dart';
import 'package:unidate/app/core/widgets/button.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:unidate/app/modules/profile/views/setup/update_bio.view.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/generated/assets.gen.dart';

class SetupProfileView extends StatelessWidget {
  const SetupProfileView({super.key});

  @override
  Widget build(BuildContext context) {
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
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                      },
                    ),
                    // Dropdown
                    AppInput(
                      placeHolder: 'Enter ',
                      label: 'Your gender',
                      enabled: false,
                      onTap: () {},
                    ),
                    // Dropdown button multiple
                    const AppInput(
                        placeHolder: 'Enter ',
                        label: 'When\'s your hoping to find'),
                    // Slider
                    const AppInput(
                        placeHolder: 'Enter your name', label: 'Your height'),
                    // Sllider
                    const AppInput(
                        placeHolder: 'Enter your name', label: 'Your weight'),
                    // Bottómheet
                    const AppInput(
                        placeHolder: 'Enter your name', label: 'Education'),
                  ],
                ),
              ),
            ),
            const VSpacer(16),
            PrimaryButton(
              onPressed: () => Get.toNamed(AppRoutes.SETUP_WORDSINTO),
              text: 'Next step',
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarPicker extends StatelessWidget {
  const AvatarPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          color: AppColors.divider,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 140,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.bgPaper,
                ),
                padding: const EdgeInsets.all(12),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(2),
            child: AppSvgPicture(
              AppAssets.icons.add,
              size: 20,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
