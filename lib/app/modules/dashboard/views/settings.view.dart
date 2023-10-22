import 'package:flutter/material.dart';
import 'package:unidate/core/values/app_colors.dart';
import 'package:unidate/core/values/app_text_styles.dart';
import 'package:unidate/core/widgets/image.dart';
import 'package:unidate/core/widgets/spacer.dart';
import 'package:unidate/generated/assets.gen.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgPaper,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const VSpacer(72),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                  height: 72,
                  width: 72,
                  child: AppAssets.images.users.user4.image(
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const VSpacer(16),
              Text(
                'John Doe',
                style: AppTextStyles.h5,
              ),
              const VSpacer(8),
              Text(
                'phsang@gmail.com',
                style: AppTextStyles.body2,
              ),
              const VSpacer(24),
              Row(
                children: [
                  _buildQuickView(AppAssets.icons.like, '12'),
                  const HSpacer(12),
                  _buildQuickView(AppAssets.icons.like, '12'),
                  const HSpacer(12),
                  _buildQuickView(AppAssets.icons.like, '12'),
                  // Lượt thích
                  // Lượt ghé thăm
                  // Lượt kết nối
                ],
              ),
              const VSpacer(32),
              _buildButton(Icons.edit, 'Update Profile'),
              _buildButton(Icons.photo, 'My Photos'),
              _buildButton(Icons.notifications, 'Notifications'),
              _buildButton(Icons.logout, 'Logout'),
              const VSpacer(48)
            ],
          ),
        ));
  }

  Widget _buildQuickView(String icon, String value) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.bgNeutral,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: AppSvgPicture(
                      icon,
                      size: 24,
                    ),
                  ),
                  const VSpacer(8),
                  Text(
                    value,
                    style: AppTextStyles.h5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(IconData icon, String text) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgNeutral,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Row(
              children: [
                Icon(icon),
                const SizedBox(width: 16),
                Text(
                  text,
                  style: AppTextStyles.body2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
