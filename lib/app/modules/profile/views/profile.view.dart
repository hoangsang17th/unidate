import 'package:flutter/material.dart';
import 'package:unidate/core/values/app_colors.dart';
import 'package:unidate/core/values/app_text_styles.dart';
import 'package:unidate/core/widgets/app_bar.dart';
import 'package:unidate/core/widgets/spacer.dart';
import 'package:unidate/generated/assets.gen.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPaper,
      appBar: AppBar(
        backgroundColor: AppColors.bgPaper,
        shadowColor: AppColors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          AppAssets.images.users.user4.image(
            fit: BoxFit.fitWidth,
            width: double.infinity,
            height: 300,
          ),
          const VSpacer(20),
          Row(
            children: [
              Text(
                'Rohini',
                style: AppTextStyles.h3,
              ),
              Text(
                ', 20',
                style: AppTextStyles.h4,
              ),
            ],
          ),
          const VSpacer(12),
          Text(
            'Đà Nẵng, Việt Nam',
            style: AppTextStyles.subtitle2,
          ),
          const VSpacer(12),
          Text(
            'I\'m a student at University of Science and Technology of Hanoi. ',
            style: AppTextStyles.body2,
          ),
          const VSpacer(12),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              Chip(
                label: const Text('Flutter'),
                backgroundColor: Colors.grey[300],
              ),
              Chip(
                label: const Text('Dart'),
                backgroundColor: Colors.grey[300],
              ),
              Chip(
                label: const Text('Firebase'),
                backgroundColor: Colors.grey[300],
              ),
            ],
          ),
          const VSpacer(12),
          // Music favorites
          // Images from Instagram
        ],
      ),
    );
  }
}
