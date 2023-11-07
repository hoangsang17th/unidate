import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/image.dart';
import '../../../../core/widgets/spacer.dart';
import '../../../../routes/app_pages.dart';

import 'update_bio.view.dart';

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


class AvatarPicker extends StatelessWidget {
  final Function()? onTap;
  const AvatarPicker({
    super.key,
    this.onTap,
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
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );  
    
    
              },
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
