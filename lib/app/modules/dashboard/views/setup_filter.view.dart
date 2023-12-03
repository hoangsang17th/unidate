import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';
import 'package:unidate/app/core/widgets/spacer.dart';

class SetupFilterView extends StatelessWidget {
  const SetupFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 1,
        shadowColor: AppColors.divider,
        title: Text(
          'Setup Filter',
          style: AppTextStyles.h5,
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.close,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('What\'s your type?', style: AppTextStyles.h5,),
          VSpacer(24),
          Text('Preferences help us personalize your daily batch in Suggested. Changes apply at noon', style: AppTextStyles.body1,),

        
          VSpacer(24),
        ],
      )
    );
  }
}
