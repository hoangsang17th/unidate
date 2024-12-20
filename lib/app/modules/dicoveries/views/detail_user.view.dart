import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:unidate/app/modules/dicoveries/controllers/detail_user.controller.dart';
import 'package:unidate/app/modules/profile/views/settings.view.dart';
import 'package:unidate/app/modules/dicoveries/views/widgets/app_grid_view.dart';
import 'package:unidate/app/modules/profile/enums.dart';
import 'dart:math' as math;

import 'package:unidate/generated/assets.gen.dart';

class DetailUserView extends GetView<DetailUserController> {
  const DetailUserView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<DetailUserController>(
        init: Get.put(DetailUserController()),
        builder: (context) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Stack(
              children: [
                if (controller.isLoading)
                  AppShimmer(height: Get.height / 2, width: Get.width)
                else
                  CustomScrollView(slivers: [
                    SliverToBoxAdapter(
                      child: AppNetworkPicture(
                        controller.userInfo.avatar!,
                        height: Get.height / 2,
                        width: Get.width,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const VSpacer(24),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: '${controller.userInfo.fullname}, ',
                                      style: AppTextStyles.h2),
                                  TextSpan(
                                      text: '${controller.userInfo.age}',
                                      style: AppTextStyles.h4),
                                ],
                              ),
                            ),
                            const VSpacer(12),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.textSecondary,
                                  size: 16,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '${controller.userInfo.distance} km',
                                  style: AppTextStyles.h6,
                                ),
                              ],
                            ),
                            const VSpacer(20),
                            Text('ABOUT ME', style: AppTextStyles.h4),
                            const VSpacer(12),
                            if (controller.isLoading) ...[
                              AppShimmer(height: 20, width: Get.width * 3 / 4),
                              const VSpacer(8),
                              AppShimmer(height: 20, width: Get.width / 2),
                            ] else ...[
                              if (controller.userInfo.education != null)
                                _buildInfo(
                                  AppAssets.icons.award55,
                                  controller.userInfo.education!.name,
                                ),
                              _buildInfo(
                                AppAssets.icons.gender,
                                controller.userInfo.gender.name,
                              ),
                              _buildInfo(
                                AppAssets.icons.height,
                                '${controller.userInfo.tall} cm',
                              ),
                              _buildInfo(
                                AppAssets.icons.weight,
                                '${controller.userInfo.weight} kg',
                              ),
                              if (controller.userInfo.biography != null)
                                _buildInfo(
                                  AppAssets.icons.bio,
                                  controller.userInfo.biography!,
                                ),
                            ],
                            const VSpacer(20),
                            Text('INTERESTS ME', style: AppTextStyles.h4),
                            const VSpacer(12),
                            if (controller.isLoading) ...[
                              const Row(
                                children: [
                                  AppShimmer(height: 20, width: 50),
                                  HSpacer(8),
                                  AppShimmer(height: 20, width: 30),
                                ],
                              )
                            ] else
                              Wrap(
                                spacing: 8,
                                runSpacing: 0,
                                children: List.generate(
                                    controller.userInfo.wordInto.length,
                                    (index) {
                                  final color = Color(
                                      (math.Random().nextDouble() * 0xFFFFFF)
                                          .toInt());
                                  return _chip(
                                    background: color.withOpacity(0.1),
                                    title: controller.userInfo.wordInto[index]
                                        .toString()
                                        .split('.')
                                        .last,
                                  );
                                }),
                              ),
                            const VSpacer(20),
                            Text('UNIDATE PHOTOS', style: AppTextStyles.h4),
                            const VSpacer(12),
                            AppGridView(
                              images: controller.userInfo.pictures,
                            ),
                            const VSpacer(150),
                          ],
                        ),
                      ),
                    ),
                  ]),
                if (controller.user.isCanActions)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 50),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.white,
                            Colors.white,
                            Colors.white.withOpacity(0.6),
                            Colors.white.withOpacity(0),
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildActionButton(
                            AppAssets.icons.dislike,
                            () {
                              controller.onSwipeUser(SwipeType.Dislike);
                            },
                          ),
                          const HSpacer(20),
                          if (controller.user.isCanReconsider)
                            _buildActionButton(AppAssets.icons.reconsider, () {
                              controller.onSwipeUser(SwipeType.Reconsider);
                            }, 24),
                          const HSpacer(20),
                          _buildActionButton(
                            AppAssets.icons.like,
                            () {
                              controller.onSwipeUser(SwipeType.Like);
                            },
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          );
        });
  }

  Widget _buildActionButton(String icon, Function() onTap, [double size = 32]) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.2),
              offset: const Offset(4, 4),
              blurRadius: 20,
              spreadRadius: 2,
            )
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: AppSvgPicture(
              icon,
              size: size,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfo(String icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, right: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: AppSvgPicture(
              icon,
              color: AppColors.textPrimary,
              size: 16,
            ),
          ),
          const HSpacer(8),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.body1,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip({
    required Color background,
    required String title,
  }) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      label: Text(title, style: AppTextStyles.body2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      backgroundColor: background,
    );
  }
}
