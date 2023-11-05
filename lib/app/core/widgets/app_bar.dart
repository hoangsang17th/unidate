import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/generated/assets.gen.dart';

class AppBarSystem extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const AppBarSystem({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bgPaper,
      elevation: 0,
      shadowColor: AppColors.divider,
      leading: IconButton(
        onPressed: Get.back,
        icon: AppSvgPicture(
          AppAssets.icons.chevronLeft,
          size: 24,
        ),
      ),
      title: Text(
        title ?? "",
        style: AppTextStyles.h5,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
