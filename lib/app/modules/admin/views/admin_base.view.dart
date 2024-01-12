import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unidate/app/core/widgets/app_text_field.dart';
import 'package:unidate/app/modules/admin/entities/admin.entity.dart';
import 'package:unidate/app/modules/dicoveries/entities/discovery.entity.dart';
import 'package:unidate/app/modules/dicoveries/views/widgets/swiper.widget.dart';
import 'package:unidate/app/modules/profile/controllers/settings.controller.dart';
import 'package:unidate/app/routes/app_pages.dart';

import '../../../../generated/assets.gen.dart';
import '../../../core/values/app_color.palettes.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/widgets/image.dart';
import '../../../core/widgets/spacer.dart';
import '../controllers/admin.controller.dart';

// View này làm cơ sở cho các view của admin
class AdminBaseView extends GetView<AdminController> {
  const AdminBaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<AdminController>(
        init: Get.put(AdminController()),
        builder: (context) {
          return SafeArea(
              child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppImagePicture(
                                  AppAssets.images.logoPng,
                                  height: 40,
                                ),
                                Flexible(
                                    child: Text(
                                  'UniDate',
                                  style: AppTextStyles.h3,
                                  textAlign: TextAlign.center,
                                ))
                              ],
                            ),
                            const VSpacer(50),
                            if (controller.user != null) _buildAdminInfo(),
                            _buildSideItem('Users', controller.index == 1,
                                () => controller.onSideChange(1)),
                            _buildSideItem(
                                'Authentication',
                                controller.index == 2,
                                () => controller.onSideChange(2)),
                          ],
                        ),
                      ),
                      _buildLogoutButton(),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 7,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: controller.index == 1
                      ? const UsersManagementView()
                      : const UserVerifyView(),
                ),
              ),
            ],
          ));
        });
  }

  Widget _buildSideItem(String text, bool isActive, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.bgNeutral,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isActive
                  ? AppColorPalettes.primary
                  : AppColorPalettes.grey[300]!,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                text,
                style: AppTextStyles.subtitle2,
              )),
              RotatedBox(
                quarterTurns: 2,
                child: AppSvgPicture(AppAssets.icons.chevronLeft),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdminInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColorPalettes.grey[300]!,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              height: 56,
              width: 56,
              child: AppNetworkPicture(
                controller.user!.avatar,
                height: 56,
              ),
            ),
          ),
          const HSpacer(20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const VSpacer(8),
                Text(
                  controller.user!.fullname,
                  style: AppTextStyles.h5,
                ),
                const VSpacer(8),
                Text(
                  controller.user!.email,
                  style: AppTextStyles.body2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    final settingController = Get.put(SettingsController());
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
          onTap: settingController.logout,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Logout',
                    style: AppTextStyles.body2,
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.logout),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UsersManagementView extends GetView<AdminController> {
  const UsersManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AppInput(
                placeHolder: 'Search',
                onChanged: (p0) => controller.fetchUsers(p0),
              ),
              const VSpacer(12),
              Expanded(
                child: Obx(
                  () => SmartRefresher(
                    controller: controller.userRefreshController,
                    enablePullDown: true,
                    enablePullUp: false,
                    header: const WaterDropHeader(),
                    onRefresh: () => controller.fetchUsers(''),
                    child: controller.users.isEmpty
                        ? const EmptyWidget(
                            message: 'User not found',
                          )
                        : ListView.separated(
                            separatorBuilder: (context, index) =>
                                const VSpacer(12),
                            itemBuilder: (context, index) {
                              final user = controller.users[index];
                              return Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: SizedBox(
                                      height: 56,
                                      width: 56,
                                      child: AppNetworkPicture(
                                        user.avatar,
                                        height: 56,
                                      ),
                                    ),
                                  ),
                                  const HSpacer(20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const VSpacer(8),
                                        Text(
                                          user.fullname,
                                          style: AppTextStyles.h5,
                                        ),
                                        const VSpacer(8),
                                        Text(
                                          user.email,
                                          style: AppTextStyles.body2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const HSpacer(20),
                                  ElevatedButton(
                                    onPressed: () => Get.toNamed(
                                      AppRoutes.PROFILE_DETAIL,
                                      arguments: UserDiscoveryEntity(
                                        id: user.id,
                                        isCanActions: false,
                                      ),
                                    ),
                                    child: const Text('Info'),
                                  ),
                                ],
                              );
                            },
                            itemCount: controller.users.length,
                          ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class UserVerifyView extends GetView<AdminController> {
  const UserVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AppInput(
                placeHolder: 'Search',
                onChanged: (p0) => controller.fetchUserVerify(p0),
              ),
              const VSpacer(12),
              // TODO: Đưa thêm chức năng lọc theo trạng thái
              Expanded(
                child: Obx(
                  () => SmartRefresher(
                    controller: controller.verifyRefreshController,
                    enablePullDown: true,
                    enablePullUp: false,
                    header: const WaterDropHeader(),
                    onRefresh: () => controller.fetchUserVerify(''),
                    child: controller.userVerifys.isEmpty
                        ? const EmptyWidget(
                            message: 'No user to verify',
                          )
                        : ListView.builder(
                            itemBuilder: (context, index) {
                              final user = controller.userVerifys[index];
                              return Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: SizedBox(
                                      height: 56,
                                      width: 56,
                                      child: AppNetworkPicture(
                                        user.avatar,
                                        height: 56,
                                      ),
                                    ),
                                  ),
                                  const HSpacer(20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const VSpacer(8),
                                        Text(
                                          user.fullname,
                                          style: AppTextStyles.h5,
                                        ),
                                        const VSpacer(8),
                                        Text(
                                          user.email,
                                          style: AppTextStyles.body2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const HSpacer(20),
                                  ElevatedButton(
                                    onPressed: () => controller.verifyUser(
                                      user.id,
                                      VerifyStatus.Verified,
                                    ),
                                    child: const Text('Verify'),
                                  ),
                                  const HSpacer(20),
                                  ElevatedButton(
                                    onPressed: () => controller.verifyUser(
                                      user.id,
                                      VerifyStatus.Reject,
                                    ),
                                    child: const Text('Reject'),
                                  ),
                                  const HSpacer(20),
                                  ElevatedButton(
                                    onPressed: () => Get.toNamed(
                                      AppRoutes.PROFILE_DETAIL,
                                      arguments: UserDiscoveryEntity(
                                        id: user.userId,
                                        isCanActions: false,
                                      ),
                                    ),
                                    child: const Text('Info'),
                                  ),
                                ],
                              );
                            },
                            itemCount: controller.userVerifys.length,
                          ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
