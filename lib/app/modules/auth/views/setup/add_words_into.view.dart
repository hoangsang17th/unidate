import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/image.dart';
import '../../../../core/widgets/spacer.dart';
import '../../controllers/add_words_into.controller.dart';
import '../../../profile/enums.dart';
import 'update_bio.view.dart';
import '../../../../../generated/assets.gen.dart';

class AddWordsIntoView extends GetView<AddWordsIntoController> {
  const AddWordsIntoView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<AddWordsIntoController>(builder: (context) {
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
                      Text(
                        'Add some words into your profile',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.subtitle2,
                      ),
                      const VSpacer(12),
                      Text(
                        'This will help us find you better matches',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body2,
                      ),
                      const VSpacer(16),
                      Wrap(
                        children: List.generate(
                          WordIntoEnum.values.length,
                          (index) => _buildWord(index),
                        ),
                      ),
                      const VSpacer(16),
                    ],
                  ),
                ),
              ),
              PrimaryButton(
                onPressed: controller.onSubmitted,
                text: 'Next step',
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildWord(int index) {
    final word = WordIntoEnum.values[index];
    return Container(
      decoration: BoxDecoration(
        color: controller.isWordSelected(word)
            ? AppColors.bgNeutral
            : AppColors.bgPaper,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: controller.isWordSelected(word)
              ? AppColors.info
              : AppColors.transparent,
        ),
      ),
      margin: const EdgeInsets.only(
        bottom: 8,
        right: 8,
      ),
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => controller.onTapedWord(word),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 6,
            ),
            child: Text(
              word.newName,
              style: AppTextStyles.subtitle1,
            ),
          ),
        ),
      ),
    );
  }
}
