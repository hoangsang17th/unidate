import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unidate/app/modules/dicoveries/discoveries.provider.dart';
import 'package:unidate/app/modules/dicoveries/entities/discovery.entity.dart';
import 'package:unidate/app/modules/profile/enums.dart';

class MatchesController extends GetxController
    with GetTickerProviderStateMixin {
  final DiscoveriesProvider _matchProvider = DiscoveriesProvider();

  late TabController tabController;

  RefreshController whoLikedMeRefreshController = RefreshController();
  RefreshController myReconsiderRefreshController = RefreshController();

  RxList<UserDiscoveryEntity> whoLikedMe = <UserDiscoveryEntity>[].obs;
  RxList<UserDiscoveryEntity> myReconsider = <UserDiscoveryEntity>[].obs;

  RxBool isWhoLikedMeLoading = true.obs;
  RxBool isMyReconsiderLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    getWhoLikedMe();
    getMyReconsider();
  }

  Future<void> getWhoLikedMe() async {
    try {
      whoLikedMe.value = await _matchProvider.getWhoLikedMe();
    } catch (e) {
      debugPrint(e.toString());
    }
    isWhoLikedMeLoading.value = false;
    whoLikedMeRefreshController.refreshCompleted();
  }

  Future<void> getMyReconsider() async {
    try {
      myReconsider.value = await _matchProvider.getMyReconsider();
    } catch (e) {
      debugPrint(e.toString());
    }
    isMyReconsiderLoading.value = false;
    myReconsiderRefreshController.refreshCompleted();
  }

  Future<void> onSwipeUser(
    SwipeType type,
    bool isWhoLikedYouTab,
    UserDiscoveryEntity user,
  ) async {
    await _matchProvider.match(
      MatchUserParam(
        matchUserId: user.id,
        type: type,
      ),
    );
    if (isWhoLikedYouTab) {
      whoLikedMe.remove(user);
    } else {
      myReconsider.remove(user);
    }
  }
}
