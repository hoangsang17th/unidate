import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/modules/dashboard/controllers/home.controller.dart';
import 'package:unidate/app/modules/dashboard/widgets/profile.view.dart';
import 'package:unidate/app/modules/dashboard/widgets/match_card.widget.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/core/values/app_colors.dart';
import 'package:unidate/core/values/app_text_styles.dart';
import 'package:unidate/core/widgets/image.dart';
import 'package:unidate/core/widgets/spacer.dart';
import 'package:unidate/generated/assets.gen.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX<HomeController>(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.transparent,
            elevation: 0,
            shadowColor: AppColors.divider,
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: SizedBox(
            width: Get.width,
            height: Get.height - 56,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: controller.draggableItems
                      .map(
                        (e) => MatchCard(
                            e.imageAsset,
                          
                        ),
                      )
                      .toList(),
                ),
                Positioned(
                  bottom: 0,
                  child: Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildActionButton(
                          AppAssets.icons.dislike,
                          controller.swipeStatus == Swipe.left,
                        ),
                        const HSpacer(60),
                        _buildActionButton(
                          AppAssets.icons.like,
                          controller.swipeStatus == Swipe.right,
                        ),
                      ],
                    );
                  }),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildActionButton(String icon, bool isActive) {
    return AnimatedScale(
      scale: isActive ? 1.2 : 1,
      duration: const Duration(milliseconds: 250),
      child: Container(
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
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: AppSvgPicture(
                icon,
                size: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
