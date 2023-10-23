import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/modules/dashboard/widgets/profile.view.dart';
import 'package:unidate/generated/assets.gen.dart';

enum Swipe { left, right, none }
class HomeController extends GetxController {
  final RxBool _isDragging = false.obs;
  bool get isDragging => _isDragging.value;

  final Rx<Offset> _offset = Offset.zero.obs;
  Offset get offset => _offset.value;

  final RxDouble _angle = 0.0.obs;
  double get angle => _angle.value;
  set angle(double value) => _angle.value = value;

  final Rx<Swipe> _swipeStatus = Swipe.none.obs;
  Swipe get swipeStatus => _swipeStatus.value;

  RxList<Profile> draggableItems = [
    Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset: AppAssets.images.users.user1),
    Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset: AppAssets.images.users.user2),
    Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset: AppAssets.images.users.user3),
    Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset: AppAssets.images.users.user4),
    Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset: AppAssets.images.users.user5),
  ].obs;
  void onDragStart(DragStartDetails details) {
    _isDragging(true);
    // _offset.value = details.globalPosition;
  }

  void onDragUpdate(DragUpdateDetails details) {
    _offset.value += details.delta;
    final dx = offset.dx;
    final globalPosition = details.globalPosition;
    if (dx > 0 && globalPosition.dx > Get.width / 3) {
      _swipeStatus(Swipe.right);
    } else if (dx < 0 && globalPosition.dx < Get.width / 3) {
      _swipeStatus(Swipe.left);
    } else {
      _swipeStatus(Swipe.none);
    }

    angle = (45 * dx / Get.width) * pi / 180;
  }

  void onDragEnd(DragEndDetails details) {
    _resetOffset();
  }

  void _resetOffset() {
    _swipeStatus(Swipe.none);
    _isDragging(false);
    angle = 0;
    _offset.value = Offset.zero;
  }
}
