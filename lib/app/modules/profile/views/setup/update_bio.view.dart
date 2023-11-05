import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';
import 'package:unidate/app/core/widgets/app_bar.dart';
import 'package:unidate/app/core/widgets/app_text_field.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:unidate/app/routes/app_pages.dart';

class UpdateBioScreen extends StatefulWidget {
  const UpdateBioScreen({super.key});

  @override
  _UpdateBioScreenState createState() => _UpdateBioScreenState();
}

class _UpdateBioScreenState extends State<UpdateBioScreen> {
  String _newBio = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSystem(
        title: 'Update Bio',
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.SETUP_PROFILE),
            icon: Icon(
              CupertinoIcons.checkmark_circle,
              color: AppColors.textPrimary,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please introduce yourself to other users.',
              style: AppTextStyles.h3,
            ),
            const VSpacer(12),
            AppInput(
              label: 'Bio',
              placeHolder: 'Enter your bio',
              onChanged: (value) => _newBio = value,
              minLines: 10,
              maxLines: 20,
              maxLength: 1000,
            ),
            const VSpacer(4),
            Text(
              '1000 characters left',
              style: AppTextStyles.body2.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
