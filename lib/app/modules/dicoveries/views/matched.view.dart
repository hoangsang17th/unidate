import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';
import 'package:unidate/app/core/widgets/button.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:unidate/app/modules/dicoveries/controllers/matched.controller.dart';

class MatchedView extends GetView<MatchedController> {
  const MatchedView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchedController>(
      init: Get.put(MatchedController()),
      builder: (context) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const VSpacer(20),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Transform.rotate(
                          angle: 0.2,
                          child: AppNetworkPicture(
                            controller.user.avatar,
                            height: Get.height / 3,
                            width: Get.width / 2,
                            radius: 16,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 170,
                        left: 20,
                        child: Transform.rotate(
                          angle: -0.2,
                          child: AppNetworkPicture(
                            controller.userMatched.who.avatar,
                            height: Get.height / 3,
                            width: Get.width / 2,
                            radius: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const VSpacer(20),
                Text(
                  'You and ${controller.user.fullname.split(' ').last} like each other. Why not make the first move?',
                  style: AppTextStyles.subtitle1.copyWith(
                    color: AppColors.error,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                const VSpacer(12),
                Text(
                  'Start a conversation now with ${controller.userMatched.who.fullname}!',
                  style: AppTextStyles.body2,
                  textAlign: TextAlign.center,
                ),
                const VSpacer(80),
                PrimaryButton(
                  onPressed: controller.onSayHello,
                  text: 'Say hello!',
                ),
                const VSpacer(8),
                SecondaryButton(
                  onPressed: controller.onKeepSwiping,
                  text: 'Keep swiping',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
