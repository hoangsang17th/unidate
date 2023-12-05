import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unidate/app/data/entities/match.entity.dart';
import 'package:unidate/app/data/providers/match.provider.dart';
import 'package:unidate/app/modules/profile/constant.dart';
import 'package:unidate/app/modules/profile/enums.dart';
import 'package:unidate/app/routes/app_pages.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final MatchProvider _matchProvider = MatchProvider();

  RxList<UserDiscoveryEntity> discoveries = <UserDiscoveryEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    getDiscoveries(whenLoadMore: 0);
  }

  Future<void> getDiscoveries({
    int whenLoadMore = whenLoadMore,
  }) async {
    try {
      discoveries.value = await _matchProvider.getDiscoveries(
        DiscoveryParam(userSkip: whenLoadMore),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> onSwiped(int userMatchId, SwipeType type) async {
    debugPrint('${type.name} $userMatchId');
    try {
      final MatchUserEntity? match = await _matchProvider.match(
        MatchUserParam(
          matchUserId: userMatchId,
          type: type,
        ),
      );
      if (match != null) {
        Get.toNamed(
          AppRoutes.MATCHED,
          arguments: match,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> loadMoreDiscoveries() async {
    try {
      final _discoveries = await _matchProvider.getDiscoveries(
        DiscoveryParam(),
      );
      discoveries.insertAll(0, _discoveries.toList());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> onRefresh() async {
    EasyLoading.show(status: 'Waiting to load data...');

    await getDiscoveries(whenLoadMore: 0);
    Future.delayed(const Duration(seconds: 1), () {
      EasyLoading.dismiss();
    });
  }
}
