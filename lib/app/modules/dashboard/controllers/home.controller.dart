import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/modules/dashboard/widgets/profile.view.dart';
import 'package:unidate/generated/assets.gen.dart';
import 'package:unidate/app/modules/dashboard/enums.dart';

class HomeController extends GetxController {
  final RxBool _isDragging = false.obs;
  bool get isDragging => _isDragging.value;

  final Rx<Offset> _offset = Offset.zero.obs;
  Offset get offset => _offset.value;

  final RxDouble _angle = 0.0.obs;
  double get angle => _angle.value;
  set angle(double value) => _angle.value = value;

  final Rx<MatchCardStatus> _swipeStatus = MatchCardStatus.none.obs;
  MatchCardStatus get swipeStatus => _swipeStatus.value;

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
    const position = 50;

    if (dx >= position) {
      _swipeStatus(MatchCardStatus.like);
    } else if (dx <= -position) {
      _swipeStatus(MatchCardStatus.dislike);
    } else {
      _swipeStatus(MatchCardStatus.none);
    }

    angle = (45 * dx / Get.width) * pi / 180;
  }

  void onLiked() {
    _angle(20);
    _offset.value += Offset(Get.width * 2, 0);
    draggableItems.removeLast();
  }

  void onDragEnd(DragEndDetails details) {
    switch (swipeStatus) {
      case MatchCardStatus.like:
        onLiked();
        break;
      default:
    }
    _resetOffset();
  }

  void _resetOffset() {
    _swipeStatus(MatchCardStatus.none);
    _isDragging(false);
    angle = 0;
    _offset.value = Offset.zero;
  }
}
