import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unidate/app/modules/dicoveries/discoveries.provider.dart';
import 'package:unidate/app/modules/dicoveries/controllers/home.controller.dart';
import 'package:unidate/app/modules/dicoveries/entities/discovery.entity.dart';
import 'package:unidate/app/modules/profile/constant.dart';
import 'package:unidate/app/modules/profile/enums.dart';

class DetailUserController extends GetxController {
  final DiscoveriesProvider _matchProvider = DiscoveriesProvider();

  final Rxn<UserDiscoveryEntity> _user = Rxn<UserDiscoveryEntity>();
  UserDiscoveryEntity get user => _user.value!;
  final Rxn<UserInfoDiscoveryEntity> _userInfo = Rxn<UserInfoDiscoveryEntity>();
  UserInfoDiscoveryEntity get userInfo => _userInfo.value!;

  final RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    _user.value = Get.arguments as UserDiscoveryEntity;
    getDetailUser();
  }

  Future<void> getDetailUser() async {
    try {
      _isLoading(true);
      _userInfo.value = await _matchProvider.getUserInfo(_user.value!.id);

      _isLoading(false);
    } catch (e) {
      _isLoading(false);
      debugPrint(e.toString());
    }
  }

  Future<void> onSwipeUser(SwipeType type) async {
    Get.back();
    await MatchingController.to.onSwiped(
      user.id,
      type,
    );
    MatchingController.to.discoveries.remove(user);
    showSnackbar(
      'You ${type.name} ${user.fullname}',
    );
  }
}
