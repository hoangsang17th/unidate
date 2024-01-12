// TODO: Triển khai màn hình này hiển thị danh sách những người mình đã block và hiển thị họ ra ngoài

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';
import 'package:unidate/app/core/widgets/app_bar.dart';
import 'package:unidate/app/modules/conversations/controllers/blocked.controller.dart';
import 'package:unidate/app/modules/dicoveries/views/widgets/swiper.widget.dart';

class BlockedView extends GetView<BlockedController> {
  const BlockedView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlockedController>(
        init: Get.put(BlockedController()),
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.bg,
              elevation: 1,
              shadowColor: AppColors.divider,
              title: Text(
                'User Blocked ',
                style: AppTextStyles.h5,
              ),
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_sharp,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            body: Obx(
              () => controller.blockedUsers.isEmpty
                  ? const EmptyWidget()
                  : ListView.builder(
                      itemCount: controller.blockedUsers.length,
                      itemBuilder: (context, index) {
                        final user = controller.blockedUsers[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.avatar),
                          ),
                          title: Text(user.fullname),
                          subtitle: Text(user.email),
                          trailing: IconButton(
                            onPressed: () => controller.unBlock(user.userId),
                            icon: const Icon(
                              Icons.person_remove_outlined,
                              color: AppColors.primary,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          );
        });
  }
}
