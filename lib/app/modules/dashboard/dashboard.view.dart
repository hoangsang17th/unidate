import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/modules/dashboard/dashboard.controller.dart';
import 'package:unidate/app/modules/conversations/views/conversation.view.dart';
import 'package:unidate/app/modules/matches/matches.view.dart';
import 'package:unidate/app/modules/dicoveries/views/home.view.dart';
import 'package:unidate/app/modules/profile/views/settings.view.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/widgets/animated_index_stack.dart';
import 'package:unidate/app/core/widgets/image.dart';

class DashBoardView extends GetView<DashBoardController> {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<DashBoardController>(
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.bgPaper,
          body: AnimatedIndexStack(
            children: const [
              HomeView(),
              MatchesView(),
              ConversationView(),
              SettingsView(),
            ],
            index: controller.currentIndex,
          ),
          extendBody: true,
          bottomNavigationBar: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.bg,
                  border: Border.all(
                    color: AppColors.divider,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    controller.iconNavigations.length,
                    (index) => _buildButton(index),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildButton(int index) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => controller.onChangedTab(index),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: AppSvgPicture(
              controller.iconNavigations[index],
              size: 24,
              color: index == controller.currentIndex
                  ? const Color(0xff2AAC7A)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
