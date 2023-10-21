import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unidate/core/values/app_colors.dart';
import 'package:unidate/core/widgets/image.dart';
import 'package:unidate/generated/assets.gen.dart';

class AppBarSystem extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSystem({
    super.key,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
