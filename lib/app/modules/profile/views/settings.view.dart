import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/modules/dashboard/dashboard.controller.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/widgets/image.dart';
import '../../../core/widgets/spacer.dart';
import '../controllers/settings.controller.dart';
import 'package:shimmer/shimmer.dart';
import '../../../routes/app_pages.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (context) {
        return Stack(
          children: [
            Scaffold(
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
                    const VSpacer(32),
                    _buildButton(
                      Icons.message,
                      'Update Bio',
                      () => Get.toNamed(
                        AppRoutes.SETUP_BIO,
                        arguments: controller.user?.bio ?? '',
                      ),
                    ),
                    _buildButton(
                      Icons.location_on_rounded,
                      'Update Location',
                      () {
                        Get.toNamed(
                          AppRoutes.SETUP_LOCATION,
                          arguments: true,
                        );
                        DashBoardController.to.setAllowRealtimeLocation();
                      },
                    ),
                    _buildButton(Icons.photo, 'Update Photos'),
                    _buildButton(
                      Icons.notifications,
                      'Notifications',
                      () => Get.toNamed(AppRoutes.NOTIFICATIONS),
                    ),
                    _buildButton(
                      Icons.verified_outlined,
                      'Request Verify',
                      controller.requestVerify,
                    ),
                    _buildButton(Icons.logout, 'Logout', controller.logout),
                    // TODO: Connect account
                    // Connect your instagram account
                    // Connecting your Instagram will add your lasest photos to your profile. Your Instagram username will also be visible on your profile.
                    const VSpacer(48)
                  ],
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  (controller.user?.isVerified ?? false)
                      ? 'Verified'
                      : 'Unverified',
                ),
              ),
            ),
          ],
        );
      },
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
