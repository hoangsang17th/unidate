import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';
import 'package:unidate/app/core/widgets/button.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:unidate/generated/assets.gen.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          AppSvgPicture(
            AppAssets.images.auth.member,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 48, 48),
            child: Column(
              children: [
                const VSpacer(12),
                Text(
                  'Find your partner in life',
                  style: AppTextStyles.h2,
                ),
                const VSpacer(12),
                Text(
                  'We created to bring together amazing singles who want to find love, laughter and happily ever after! ',
                  style: AppTextStyles.body2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PrimaryButton(
              onPressed: () => Get.toNamed(AppRoutes.REGISTER),
              text: 'Join now',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: InkWell(
              onTap: () => Get.toNamed(AppRoutes.LOGIN),
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Already have account? ',
                      style: AppTextStyles.body2,
                    ),
                    Text(
                      'Log in',
                      style: AppTextStyles.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
