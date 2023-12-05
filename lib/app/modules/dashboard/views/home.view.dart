import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/modules/dashboard/controllers/home.controller.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/modules/dashboard/widgets/swiper.widget.dart';
import 'package:unidate/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(
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
                  onPressed: () => Get.toNamed(AppRoutes.SETUP_FILTER),
                  icon: const Icon(
                    Icons.settings,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            body: Obx(
              () => SwiperWidget(
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
