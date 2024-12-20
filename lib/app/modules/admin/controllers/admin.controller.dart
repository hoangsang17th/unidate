import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unidate/app/modules/admin/admin.provider.dart';
import 'package:unidate/app/modules/admin/entities/admin.entity.dart';
import 'package:unidate/app/modules/dashboard/dashboard.controller.dart';

class AdminController extends DashBoardController {
  final adminProviders = AdminProviders();

  final RxInt _index = 1.obs;
  int get index => _index.value;

  RxList<VerifyUserEntity> userVerifys = <VerifyUserEntity>[].obs;
  RxList<UserSystemEntity> users = <UserSystemEntity>[].obs;

  final RefreshController verifyRefreshController =
      RefreshController(initialRefresh: false);

  final RefreshController userRefreshController =
      RefreshController(initialRefresh: false);

  void onSideChange(int index) {
    _index.value = index;
  }

  Rx<VerifyStatus> verifyStatus = VerifyStatus.Waiting.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchUserVerify('');
    fetchUsers('');
  }

  Future<void> verifyUser(int id, VerifyStatus status) async {
    try {
      await adminProviders.verifyUser(
        VerifyUserParam(
          id: id,
          status: status,
          userName: '',
        ),
      );
      await fetchUserVerify('');
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchUserVerify(String? userName) async {
    try {
      userVerifys.value = await adminProviders.verifyUsers(VerifyUserParam(
        status: verifyStatus.value,
        userName: userName,
      ));
      verifyRefreshController.refreshCompleted();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchUsers(String? searchKey) async {
    try {
      users.value = await adminProviders.users(searchKey);
      userRefreshController.refreshCompleted();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
