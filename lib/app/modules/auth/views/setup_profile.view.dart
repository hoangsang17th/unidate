import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/core/values/app_colors.dart';
import 'package:unidate/core/widgets/app_bar.dart';
import 'package:unidate/core/widgets/image.dart';
import 'package:unidate/core/widgets/spacer.dart';
import 'package:unidate/generated/assets.gen.dart';

class SetupProfileView extends StatelessWidget {
  const SetupProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarSystem(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('SetupProfileView'),
            VSpacer(12),
            Row(
              children: [
                Expanded(child: AvatarPicker()),
                HSpacer(12),
                Expanded(child: AvatarPicker()),
                HSpacer(12),
                Expanded(child: AvatarPicker()),
              ],
            ),
            // Sở thích
            //
            VSpacer(12),
            Text('Select trường học có phần search'),
            VSpacer(12),
            Text('Giới tính có 2 radio button'),
            VSpacer(12),
            Text('Có 1 range slider để chọn độ tuổi muốn khớp'),
            VSpacer(12),
            Text('Có 1 range slider để chọn chiều cao muốn khớp'),
          ],
        ),
      ),
    );
  }
}

class AvatarPicker extends StatelessWidget {
  const AvatarPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          color: AppColors.divider,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: Get.width / 3,
                padding: const EdgeInsets.all(12),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(2),
            child: AppSvgPicture(
              AppAssets.icons.add,
              size: 20,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
