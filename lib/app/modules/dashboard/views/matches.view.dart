import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/modules/dashboard/widgets/app_grid_view.dart';
import 'package:unidate/core/values/app_colors.dart';
import 'package:unidate/core/values/app_text_styles.dart';
import 'package:unidate/core/widgets/spacer.dart';
import 'package:unidate/generated/assets.gen.dart';

class MatchesView extends StatelessWidget {
  const MatchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 1,
        shadowColor: AppColors.divider,
        centerTitle: true,
        title: Text(
          'Matches',
          style: AppTextStyles.h5,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Liked',
              style: AppTextStyles.subtitle1,
            ),
            const VSpacer(8),
            SizedBox(
              height: 200,
              width: Get.width,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                primary: false,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.bgNeutral,
                      border: Border.all(color: AppColors.divider, width: 0.5),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        AppAssets.images.users.user1.path,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const HSpacer(8),
              ),
            ),
            const VSpacer(16),
            Text(
              'Who liked you',
              style: AppTextStyles.subtitle1,
            ),
            const VSpacer(8),
            const AppGridView()
          ],
        ),
      ),
    );
  }
}
