import 'package:get/get.dart';
import 'package:unidate/app/data/entities/match.entity.dart';
import 'package:unidate/app/data/providers/match.provider.dart';
import 'package:unidate/app/modules/dashboard/controllers/home.controller.dart';
import 'package:unidate/app/modules/profile/constant.dart';
import 'package:unidate/app/modules/profile/enums.dart';

class UserProfileController extends GetxController {
  final MatchProvider _matchProvider = MatchProvider();

  final Rxn<UserDiscoveryEntity> _user = Rxn<UserDiscoveryEntity>();
  UserDiscoveryEntity get user => _user.value!;
  final Rxn<UserInfoDiscoveryEntity> _userInfo = Rxn<UserInfoDiscoveryEntity>();
  UserInfoDiscoveryEntity get userInfo => _userInfo.value!;

  final RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    _user.value = Get.arguments;
    getDetailUser();
  }

  Future<void> getDetailUser() async {
    try {
      _userInfo.value = await _matchProvider.getUserInfo(_user.value!.id);

      _isLoading(false);
    } catch (e) {
      _isLoading(false);
      print(e);
    }
  }

  Future<void> onSwipeUser(SwipeType type) async {
    Get.back();
    await HomeController.to.onSwiped(
      user.id,
      type,
    );
    HomeController.to.discoveries.remove(user);
    showSnackbar(
      'You ${type.name} ${user.fullname}',
    );
  }
}
