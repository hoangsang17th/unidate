import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/modules/dicoveries/controllers/home.controller.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/modules/dicoveries/views/widgets/swiper.widget.dart';

class HomeView extends GetView<MatchingController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MatchingController>(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.transparent,
              elevation: 0,
              shadowColor: AppColors.divider,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: () => controller.onRefresh(),
                  icon: const Icon(
                    Icons.refresh_outlined,
                    color: AppColors.primary,
                  ),
                ),
                IconButton(
                  onPressed: controller.onSetupFilter,
                  icon: const Icon(
                    Icons.settings,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            body: Obx(
              () => SwiperWidget(
                // ignore: invalid_use_of_protected_member
                items: controller.discoveries.value,
                onSwiped: controller.onSwiped,
                onNeedLoadMore: () => controller.loadMoreDiscoveries(),
              ),
            ),
          );
        },
      ),
    );
  }
}
