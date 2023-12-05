import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:unidate/app/data/entities/match.entity.dart';
import 'package:unidate/app/modules/dashboard/controllers/matches.controller.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';
import 'package:unidate/app/modules/dashboard/widgets/swiper.widget.dart';
import 'package:unidate/app/modules/profile/constant.dart';
import 'package:unidate/app/modules/profile/enums.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/generated/assets.gen.dart';

class MatchesView extends GetView<MatchesController> {
  const MatchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchesController>(
      init: Get.put(MatchesController()),
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.bg,
            elevation: 0,
            shadowColor: AppColors.divider,
            centerTitle: true,
            title: Text(
              'Matches',
              style: AppTextStyles.h5,
            ),
            toolbarHeight: 56,
          ),
          body: Column(
            children: [
              Container(
                color: AppColors.bg,
                child: Container(
                  height: 40,
                  width: Get.width,
                  padding: EdgeInsets.zero,
                  decoration: UnderlineTabIndicator(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: AppColors.divider,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: controller.tabController,
                    indicator: UnderlineTabIndicator(
                      borderRadius: BorderRadius.circular(80),
                      borderSide: const BorderSide(
                        color: AppColors.infoDark,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    labelPadding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 4,
                    ),
                    indicatorWeight: 0,
                    unselectedLabelColor: AppColors.textPrimary,
                    labelColor: AppColors.infoDark,
                    labelStyle: AppTextStyles.subtitle2,
                    tabs: const [
                      Tab(
                        text: 'Who liked you',
                      ),
                      Tab(
                        text: 'All my reconsider',
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    _buildWhoLikedMeTab(),
                    _buildMyReconsider(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMyReconsider() {
    return Obx(
      () => SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: const WaterDropHeader(),
        controller: controller.myReconsiderRefreshController,
        onRefresh: controller.getMyReconsider,
        child: controller.myReconsider.isEmpty
            ? const EmptyWidget(
                message: 'No one reconsidered you yet',
              )
            : AlignedGridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(16),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                itemCount: controller.myReconsider.length,
                itemBuilder: (context, index) {
                  final who = controller.myReconsider[index];
                  return _buildUser(who, false);
                },
              ),
      ),
    );
  }

  Widget _buildUser(UserDiscoveryEntity who, bool isWhoLikedYouTab) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.PROFILE_DETAIL,
          arguments: who.copyWith(isCanReconsider: false),
        );
      },
      child: Stack(
        children: [
          AppNetworkPicture(
            who.avatar!,
            radius: 20,
            height: 225,
          ),
          const VSpacer(245),
          _buildDistance(who),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButton(
                    AppAssets.icons.dislike,
                    () {
                      controller.onSwipeUser(
                        SwipeType.Dislike,
                        isWhoLikedYouTab,
                        who,
                      );
                      showSnackbar(
                        'You disliked ${who.fullname}',
                      );
                      // _onSwiped(SwipeType.Dislike);
                    },
                  ),
                  const HSpacer(20),
                  _buildActionButton(
                    AppAssets.icons.like,
                    () {
                      controller.onSwipeUser(
                        SwipeType.Like,
                        isWhoLikedYouTab,
                        who,
                      );
                      showSnackbar(
                        'You liked ${who.fullname}',
                      );
                      // _onSwiped(SwipeType.Like);
                    },
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildDistance(UserDiscoveryEntity item) {
    return Positioned(
      top: 16,
      left: 0,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.bg.withOpacity(0.5),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 8,
        ),
        child: Row(
          children: [
            AppSvgPicture(
              AppAssets.icons.sportMode,
              color: AppColors.textPrimary,
              size: 16,
            ),
            const HSpacer(8),
            Text('${item.distance} Km', style: AppTextStyles.overline),
          ],
        ),
      ),
    );
  }

  Widget _buildWhoLikedMeTab() {
    return Obx(
      () => SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: const WaterDropHeader(),
        controller: controller.whoLikedMeRefreshController,
        onRefresh: controller.getWhoLikedMe,
        child: controller.whoLikedMe.isEmpty
            ? const EmptyWidget(
                message: 'No one liked you yet',
              )
            : AlignedGridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(16),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                itemCount: controller.whoLikedMe.length,
                itemBuilder: (context, index) {
                  final who = controller.whoLikedMe[index];
                  return _buildUser(who, true);
                },
              ),
      ),
    );
  }

  Widget _buildActionButton(String icon, Function() onTap) {
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
            padding: const EdgeInsets.all(12),
            child: AppSvgPicture(
              icon,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
