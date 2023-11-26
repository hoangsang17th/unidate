import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/data/entities/match.entity.dart';
import 'package:unidate/app/data/providers/match.provider.dart';
import 'package:unidate/app/modules/profile/enums.dart';

class HomeController extends GetxController {
  final MatchProvider _matchProvider = MatchProvider();

  RxList<UserDiscoveryEntity> discoveries = <UserDiscoveryEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getDiscoveries();
  }

  Future<void> _getDiscoveries() async {
    try {
      discoveries.value = await _matchProvider.getDiscoveries(
        DiscoveryParam(),
      );
      discoveries.value = discoveries.reversed.toList();
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
        debugPrint(match.toString());
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
      discoveries.insertAll(0, _discoveries.reversed.toList());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
