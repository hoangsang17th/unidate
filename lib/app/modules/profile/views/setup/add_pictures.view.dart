import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/modules/profile/controllers/add_pictures.controller.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/image.dart';
import '../../../../core/widgets/spacer.dart';

import 'update_bio.view.dart';

class AddPicturesView extends GetView<AddPicturesController> {
  const AddPicturesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDE5B7),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GetBuilder<AddPicturesController>(builder: (context) {
              return Expanded(
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
                          Expanded(child: AvatarPicker(0)),
                          HSpacer(8),
                          Expanded(child: AvatarPicker(1)),
                          HSpacer(8),
                          Expanded(child: AvatarPicker(2)),
                        ],
                      ),
                      const VSpacer(8),
                      const Row(
                        children: [
                          Expanded(child: AvatarPicker(3)),
                          HSpacer(8),
                          Expanded(child: AvatarPicker(4)),
                          HSpacer(8),
                          Expanded(child: AvatarPicker(5)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
            PrimaryButton(
              onPressed: controller.onAddPictures,
              text: 'Next step',
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarPicker extends GetView<AddPicturesController> {
  final Function()? onTap;
  final int index;
  const AvatarPicker(
    this.index, {
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<AddPicturesController>(builder: (context) {
      final file = controller.picture(index);
      bool isPicked = file != null;
      return Stack(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            color: AppColors.divider,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: double.infinity,
                height: 140,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.bgPaper,
                ),
                child: isPicked
                    ? AppAssetPicture(
                        file,
                        width: 100,
                        height: 120,
                        radius: 12,
                      )
                    : null,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () => isPicked
                  ? controller.removeImage(index)
                  : controller.pickImage(index),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                  color: isPicked ? AppColors.error : AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(2),
                child: AppSvgPicture(
                  isPicked ? AppAssets.icons.remove : AppAssets.icons.add,
                  size: 20,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
