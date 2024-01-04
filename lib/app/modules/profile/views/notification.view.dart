import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/widgets/image.dart';
import '../../../core/widgets/spacer.dart';
import '../../dicoveries/views/widgets/swiper.widget.dart';
import '../controllers/notification.controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: Get.put(NotificationController()),
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Notification View'),
            backgroundColor: AppColors.primary,
            elevation: 0,
            shadowColor: AppColors.divider,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SmartRefresher(
              controller: controller.refreshController,
              enablePullDown: true,
              enablePullUp: false,
              header: const WaterDropHeader(),
              onRefresh: controller.getNotificationList,
              child: Obx(
                () => controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : controller.notifications.isEmpty
                        ? const EmptyWidget(
                            message: 'No notifications yet',
                          )
                        : ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.notifications.length,
                            itemBuilder: (context, index) {
                              final noti = controller.notifications[index];
                              return GestureDetector(
                                onTap: () => controller.markRead(noti.id),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.bgNeutral,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      AppNetworkPicture(
                                        noti.avatar,
                                        height: 48,
                                        width: 48,
                                        radius: 16,
                                      ),
                                      const HSpacer(16),
                                      Expanded(
                                        child: Text(
                                          noti.content,
                                          style: AppTextStyles.body2,
                                        ),
                                      ),
                                      if (!noti.isRead)
                                        Container(
                                          height: 12,
                                          width: 12,
                                          margin:
                                              const EdgeInsets.only(left: 16),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
              ),
            ),
          ),
        );
      },
    );
  }
}
