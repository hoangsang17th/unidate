import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/generated/assets.gen.dart';

class AppBarSystem extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  const AppBarSystem({
    super.key,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final ScaffoldState? scaffold = Scaffold.maybeOf(context);
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
    final bool canPop = parentRoute?.canPop ?? false;
    final bool autoShowBack = (!hasEndDrawer && canPop) ||
        (parentRoute?.impliesAppBarDismissal ?? false);
    return AppBar(
      backgroundColor: AppColors.bgPaper,
      elevation: 0,
      shadowColor: AppColors.divider,
      automaticallyImplyLeading: false,
      leading: !autoShowBack
          ? null
          : IconButton(
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
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
