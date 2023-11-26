import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:unidate/app/data/entities/match.entity.dart';
import 'package:unidate/app/modules/profile/enums.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/generated/assets.gen.dart';

class SwiperWidget extends StatefulWidget {
  final List<UserDiscoveryEntity> items;
  final Function(int userMatchId, SwipeType type) onSwiped;
  final Function() onNeedLoadMore;

  const SwiperWidget({
    super.key,
    required this.items,
    required this.onSwiped,
    required this.onNeedLoadMore,
  });

  @override
  State<SwiperWidget> createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  bool isDragging = false;
  Offset offset = Offset.zero;
  double angle = 0.0;
  SwipeType swipeStatus = SwipeType.None;

  void onDragStart(DragStartDetails details) {
    setState(() => isDragging = true);
  }

  void onDragUpdate(DragUpdateDetails details) {
    offset += details.delta;
    final dx = offset.dx;
    final dy = offset.dy;
    const position = 50;

    if (dx >= position) {
      swipeStatus = SwipeType.Like;
    } else if (dx <= -position) {
      swipeStatus = SwipeType.Dislike;
    } else if (dy <= -position) {
      swipeStatus = SwipeType.Reconsider;
    } else {
      swipeStatus = SwipeType.None;
    }

    angle = (45 * dx / Get.width) * pi / 180;
    setState(() {});
  }

  void onDragEnd(DragEndDetails details) {
    if (swipeStatus != SwipeType.None) {
      angle = 20;
      offset += Offset(Get.width * 2, 0);

      switch (swipeStatus) {
        case SwipeType.Dislike:
        case SwipeType.Like:
        case SwipeType.Reconsider:
          _onSwiped();

          break;
        default:
          break;
      }
    }

    _resetOffset();
  }

  void _onSwiped([SwipeType? swipeStatus]) {
    widget.onSwiped(widget.items.last.id, swipeStatus ?? this.swipeStatus);
    widget.items.removeLast();
    if (widget.items.length == 1) {
      widget.onNeedLoadMore();
    }
    setState(() {});
  }

  void showSnackbar(String content) {
    Get.closeCurrentSnackbar();
    Get.snackbar("", '',
        snackPosition: SnackPosition.TOP,
        titleText: const SizedBox(),
        duration: const Duration(milliseconds: 1500),
        messageText: Text(
          content,
          style: AppTextStyles.body2,
        ));
  }

  void _resetOffset() {
    swipeStatus = SwipeType.None;
    isDragging = false;
    angle = 0;
    offset = Offset.zero;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height - 56,
      child: widget.items.isEmpty
          ? Center(
              child: Text(
                'No more discoveries',
                style: AppTextStyles.h2.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            )
          : Stack(
              alignment: Alignment.topCenter,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: List.generate(
                    widget.items.length,
                    (index) => _buildBody(
                      index == widget.items.length - 1,
                      widget.items[index],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildActionButton(
                          AppAssets.icons.dislike,
                          swipeStatus == SwipeType.Dislike,
                          () {
                            showSnackbar(
                              'You disliked ${widget.items.last.fullname}',
                            );
                            _onSwiped(SwipeType.Dislike);
                          },
                        ),
                        const HSpacer(20),
                        _buildActionButton(AppAssets.icons.reconsider,
                            swipeStatus == SwipeType.Reconsider, () {
                          showSnackbar(
                            'You recosiderd ${widget.items.last.fullname}',
                          );
                          _onSwiped(SwipeType.Reconsider);
                        }, 24),
                        const HSpacer(20),
                        _buildActionButton(
                          AppAssets.icons.like,
                          swipeStatus == SwipeType.Like,
                          () {
                            showSnackbar(
                              'You liked ${widget.items.last.fullname}',
                            );
                            _onSwiped(SwipeType.Like);
                          },
                        ),
                      ],
                    ))
              ],
            ),
    );
  }

  Widget _buildActionButton(String icon, bool isActive, Function() onTap,
      [double size = 32]) {
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
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: AppSvgPicture(
                icon,
                size: size,
              ),
            ),
          ),
        ),
      ),
    );
  }

  double get width => Get.width * 0.9;

  Widget _buildBody(bool canSwipe, UserDiscoveryEntity item) {
    return SizedBox(
        height: Get.height - 180,
        width: width,
        child: canSwipe ? _buildSwipeCard(item) : _buildCard(null, item));
  }

  Widget _buildSwipeCard(UserDiscoveryEntity item) {
    return SizedBox(
      height: Get.height - 180,
      width: width,
      child: GestureDetector(
          onPanStart: onDragStart,
          onPanEnd: onDragEnd,
          onPanUpdate: onDragUpdate,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final center = constraints.smallest.center(Offset.zero);
              return AnimatedContainer(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: isDragging ? 0 : 250),
                transform: Matrix4.identity()
                  ..translate(center.dx, center.dy)
                  ..rotateZ(angle)
                  ..translate(-center.dx, -center.dy)
                  ..translate(offset.dx, offset.dy),
                child: _buildCard(center, item),
              );
            },
          )),
    );
  }

  Widget _buildCard(Offset? center, UserDiscoveryEntity item) {
    return ProfilePictures(
      pictures: item.pictures,
      children: [
        if (center != null) _buildLabelPosition(center),
        _buildDistance(item),
        _buildInfo(item)
      ],
    );
  }

  Widget _buildLabelPosition(Offset position) {
    switch (swipeStatus) {
      case SwipeType.Dislike:
        return Positioned(
          top: position.dx + 48,
          right: 24,
          child: Transform.rotate(
            angle: 30 * pi / 180,
            child: _buildLabel(AppColors.errorDark, 'DISLIKE'),
          ),
        );
      case SwipeType.Like:
        return Positioned(
          top: position.dx + 48,
          left: 24,
          child: Transform.rotate(
            angle: -30 * pi / 180,
            child: _buildLabel(AppColors.primary, 'LIKE'),
          ),
        );
      case SwipeType.Reconsider:
        return Positioned(
          top: position.dx,
          left: 0,
          right: 0,
          child: Center(child: _buildLabel(AppColors.infoDark, 'RECONSIDER')),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildLabel(Color color, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: color,
            width: 4,
          ),
        ),
      ),
      child: Text(
        label,
        style: AppTextStyles.h2.copyWith(color: color),
      ),
    );
  }

  Widget _buildDistance(UserDiscoveryEntity item) {
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
            Text('${item.distance} Km', style: AppTextStyles.subtitle1),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(UserDiscoveryEntity item) {
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
                          item.fullname,
                          style: AppTextStyles.h2.copyWith(
                            color: AppColors.textContrast,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const HSpacer(8),
                      Text(
                        "(${item.age})",
                        style: AppTextStyles.h3.copyWith(
                          color: AppColors.textContrast,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Get.toNamed(AppRoutes.PROFILE_DETAIL),
                  icon: AppSvgPicture(
                    AppAssets.icons.info,
                    size: 20,
                  ),
                ),
              ],
            ),
            const VSpacer(4),
            if (item.education != null)
              Text(
                item.education!.name,
                style: AppTextStyles.h6.copyWith(
                  color: AppColors.textContrast,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            const VSpacer(48)
          ],
        ),
      ),
    );
  }
}

class ProfilePictures extends StatefulWidget {
  final List<String> pictures;
  final List<Widget> children;

  const ProfilePictures({
    super.key,
    required this.pictures,
    required this.children,
  });

  @override
  State<ProfilePictures> createState() => _ProfilePicturesState();
}

class _ProfilePicturesState extends State<ProfilePictures> {
  late PageController controller;

  double get width => Get.width * 0.9;

  int get pictureLength => widget.pictures.length;

  double get dotWidth =>
      ((width - 48) - 8 * (pictureLength - 1)) / pictureLength;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        // Lấy vị trí tương đối so với màn hình

        double flexSize = width / 2;
        double dxOnTap = _.globalPosition.dx;

        if (dxOnTap < flexSize) {
          if (controller.page!.toInt() == 0) return;
          controller.previousPage(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeIn,
          );
        } else if (dxOnTap > flexSize) {
          if (controller.page!.toInt() == pictureLength - 1) return;
          controller.nextPage(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
          );
        }
      },
      child: Stack(
        children: [
          // Time line hiển thị số ảnh - max 6

          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return AppNetworkPicture(
                    widget.pictures[index],
                    height: Get.height - 180,
                  );
                },
                controller: controller,
                itemCount: pictureLength,
              ),
            ),
          ),
          if (pictureLength != 1)
            Positioned(
                top: 4,
                left: 16,
                right: 16,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: pictureLength,
                    effect: SlideEffect(
                      paintStyle: PaintingStyle.fill,
                      dotHeight: 4,
                      dotWidth: dotWidth,
                      radius: 16,
                      dotColor: AppColors.textContrast,
                      activeDotColor: AppColors.primary,
                      spacing: 8,
                      type: SlideType.normal,
                    ),
                  ),
                )),
          ...widget.children,
        ],
      ),
    );
  }
}
