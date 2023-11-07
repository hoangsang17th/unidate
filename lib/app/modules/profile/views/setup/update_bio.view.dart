import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/update_bio.controller.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/image.dart';
import '../../../../core/widgets/spacer.dart';
import '../../../../../generated/assets.gen.dart';

class UpdateBioScreen extends GetView<UpdateBioController> {
  const UpdateBioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateBioController>(
      builder: (UpdateBioController controller) {
        return Scaffold(
          backgroundColor: const Color(0xFFD9CCE5),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VSpacer(25),
                        const SetepNumber(1),
                        const VSpacer(56),
                        AppSvgPicture(AppAssets.images.setup.bio),
                        const VSpacer(24),
                        AppInput(
                          label: 'Bio',
                          placeHolder: 'Enter your bio',
                          minLines: 15,
                          maxLines: 20,
                          maxLength: 1000,
                          onChanged: (_) => controller.setNewBio(_),
                        ),
                        const VSpacer(4),
                        Text(
                          '1000 characters left',
                          style: AppTextStyles.body2.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const VSpacer(16),
                PrimaryButton(
                  onPressed: controller.onUpdateBio,
                  text: 'Next step',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SetepNumber extends StatelessWidget {
  const SetepNumber(
    this.stepNumber, {
    super.key,
  });

  final int stepNumber;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$stepNumber',
              style: AppTextStyles.subtitle1
                  .copyWith(color: AppColors.textPrimary),
            ),
            Text(
              ' /5',
              style: AppTextStyles.overline
                  .copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
