import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';
import 'package:unidate/app/core/widgets/app_text_field.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:unidate/app/modules/conversations/entities/conversation.entity.dart';
import 'package:unidate/app/modules/conversations/controllers/conversation.controller.dart';
import 'package:unidate/app/modules/dicoveries/views/widgets/swiper.widget.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/generated/assets.gen.dart';

class ConversationView extends GetView<ConversationController> {
  const ConversationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConversationController>(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.bgPaper,
            elevation: 0,
            shadowColor: AppColors.divider,
            title: Row(
              children: [
                AppSvgPicture(
                  AppAssets.icons.logo,
                  size: 20,
                ),
                const HSpacer(8),
                Text(
                  'Conversation',
                  style: AppTextStyles.h5,
                ),
              ],
            ),
            actions: const [],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                AppInput(
                  placeHolder: 'Search for a user',
                  onChanged: (_) => controller.getConversations(_),
                ),
                const VSpacer(12),
                Expanded(
                  child: SmartRefresher(
                    controller: controller.refreshController,
                    onRefresh: controller.onRefresh,
                    enablePullDown: true,
                    enablePullUp: false,
                    header: const WaterDropHeader(),
                    child: Obx(
                      () => controller.isLoading.isTrue
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : controller.conversations.isEmpty
                              ? const EmptyWidget(
                                  message:
                                      'This is where you\'ll have great conversations with your matches.',
                                )
                              : ListView.separated(
                                  itemCount: controller.conversations.length,
                                  primary: false,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const VSpacer(8),
                                  itemBuilder: (context, index) {
                                    return _buildItem(
                                      controller.conversations[index],
                                    );
                                  },
                                ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  InkWell _buildItem(ConversationEntity item) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => Get.toNamed(
        AppRoutes.MESSAGES,
        arguments: [item],
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.divider,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        child: Row(
          children: [
            AppNetworkPicture(
              item.avatar,
              height: 48,
              width: 48,
              radius: 100,
            ),
            const HSpacer(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          style: AppTextStyles.subtitle1,
                        ),
                      ),
                      if (item.lastTime != null)
                        Text(
                          DateFormat('dd/MM HH:mm').format(item.lastTime!),
                          style: AppTextStyles.overline,
                        ),
                    ],
                  ),
                  const VSpacer(4),
                  Text(
                    item.message,
                    style: AppTextStyles.body2.copyWith(
                      color: item.gender == null
                          ? AppColors.textSecondary
                          : AppColors.primary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
