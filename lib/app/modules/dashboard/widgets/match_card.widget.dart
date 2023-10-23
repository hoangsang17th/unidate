import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/core/values/app_colors.dart';
import 'package:unidate/core/values/app_text_styles.dart';
import 'package:unidate/core/widgets/image.dart';
import 'package:unidate/core/widgets/spacer.dart';
import 'package:unidate/generated/assets.gen.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key});

  double get width => Get.width * 0.9;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 192,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.bgNeutral,
        border: Border.all(
          color: AppColors.divider,
          width: 0.5,
        ),
      ),
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          onTapDown: (_) {
            // Lấy vị trí tương đối so với màn hình
            double widgetSize = Get.width * 0.9;

            double flexSize = widgetSize / 4;
            double prevSize = flexSize;
            double nextSize = flexSize * 3;
            double dxOnTap = _.globalPosition.dx;

            if (dxOnTap < prevSize) {
              // && Có prev
              // Chuyển sang ảnh trước
            } else if (dxOnTap > nextSize) {
              // && Có next
              // Chuyển sang ảnh tiếp theo
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
// Time line hiển thị số ảnh - max 6
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AppAssets.images.users.user2.image(
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              _buildDistance(),
              _buildInfo()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDistance() {
    return Positioned(
      top: 32,
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
          vertical: 8,
          horizontal: 16,
        ),
        child: Row(
          children: [
            AppSvgPicture(
              AppAssets.icons.sportMode,
              color: AppColors.textPrimary,
              size: 20,
            ),
            const HSpacer(8),
            Text('10 miles away', style: AppTextStyles.subtitle1),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: width,
        height: 192,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.transparent,
              AppColors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'Thoa Nguyễn',
                          style: AppTextStyles.h2.copyWith(
                            color: AppColors.textContrast,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const HSpacer(8),
                      Text(
                        '(22)',
                        style: AppTextStyles.h3.copyWith(
                          color: AppColors.textContrast,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => Get.toNamed(AppRoutes.PROFILE_DETAIL),
                  child: AppSvgPicture(
                    AppAssets.icons.info,
                    size: 20,
                  ),
                ),
              ],
            ),
            const VSpacer(4),
            Text(
              'Marketer at VKU',
              style: AppTextStyles.h6.copyWith(
                color: AppColors.textContrast,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
