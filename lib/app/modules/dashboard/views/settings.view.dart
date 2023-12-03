import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:unidate/app/modules/dashboard/controllers/profile.controller.dart';
import 'package:unidate/generated/assets.gen.dart';
import 'package:shimmer/shimmer.dart';

class SettingsView extends GetView<ProfileController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (context) {
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
                      child: AppNetworkPicture(
                        controller.user!.avatar,
                        height: 72,
                      ),
                    ),
                  ),
                  const VSpacer(16),
                  Text(
                    controller.user?.fullname ?? 'FinFree',
                    style: AppTextStyles.h5,
                  ),
                  const VSpacer(8),
                  Text(
                    controller.user?.email ?? 'dev@finfree.com',
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
                _buildButton(Icons.logout, 'Logout', controller.logout),
                const VSpacer(48)
              ],
            ),
          ),
        );
      },
    );
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

  Widget _buildButton(IconData icon, String text, [Function()? onTap]) {
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
          onTap: onTap,
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

class AppShimmer extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  const AppShimmer({
    super.key,
    required this.height,
    required this.width,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[400]!.withOpacity(0.7),
        highlightColor: Colors.grey[300]!,
        period: const Duration(milliseconds: 3000),
        child: Container(
          height: height,
          width: width,
          color: Colors.white,
        ),
      ),
    );
  }
}
