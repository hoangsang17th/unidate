import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/widgets/app_bar.dart';
import 'package:unidate/app/core/widgets/app_text_field.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/generated/assets.gen.dart';

class SetupProfileView extends StatelessWidget {
  const SetupProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSystem(
        title: 'Setup Profile',
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.SETUP_PICTURES),
            icon: Icon(
              CupertinoIcons.checkmark_circle,
              color: AppColors.textPrimary,
            ),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            AppInput(placeHolder: 'Enter your name', label: 'Name'),
            VSpacer(12),

            // Sở thích
            // Độ tuổi muốn khớp
            // Chiều cao muốn khớp
            // Giới tính muốn khớp
            // Khoảng cách muốn khớp
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
                height: Get.width / 3,
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
