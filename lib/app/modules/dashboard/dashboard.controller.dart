import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/utils/get.storage.dart';
import 'package:unidate/app/core/values/app_url.dart';
import 'package:unidate/app/modules/auth/entities/user.entity.dart';
import 'package:unidate/app/modules/auth/user.provider.dart';
import 'package:unidate/app/modules/conversations/controllers/conversation.controller.dart';
import 'package:unidate/app/modules/conversations/controllers/messages.controller.dart';
import 'package:unidate/app/modules/conversations/entities/conversation.entity.dart';
import 'package:unidate/app/modules/dicoveries/entities/discovery.entity.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/generated/assets.gen.dart';
import 'package:socket_io_client/socket_io_client.dart';

class DashBoardController extends GetxController {
  final UserProviders _userProviders = UserProviders();

  RxBool isLoading = true.obs;

  final Rxn<CurrentUserEntity> _user = Rxn();
  CurrentUserEntity? get user => _user.value;

  static DashBoardController get to => Get.find();

  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int value) => _currentIndex.value = value;

  Socket? ws;

  void onChangedTab(int index) {
    currentIndex = index;
  }

  final List<String> iconNavigations = [
    AppAssets.icons.navigationBar.home,
    AppAssets.icons.navigationBar.heart,
    AppAssets.icons.navigationBar.chat,
    AppAssets.icons.navigationBar.profile,
  ];

  Future<void> logout() async {
    await AppGetStorage.instance.deleteAll();
    Get.offAllNamed(AppRoutes.WELCOME);
  }

  @override
  void onInit() {
    super.onInit();
    initWs();
    getCurrentUser();
  }

  Future<void> initWs() async {
    String? token = await AppGetStorage.instance.read(AppGetKey.accessToken);
    try {
      ws = io(
        //  'wss://ws-feed.pro.coinbase.com'
        appWebsocketUrl,
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .setExtraHeaders({
              HttpHeaders.contentTypeHeader: Headers.jsonContentType,
              HttpHeaders.authorizationHeader: token,
            }) // optional
            .build(),
      );
      ws!.connect();
      ws!.onConnect((_) {
        onWsEvent();
      });
     
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
    if (ws != null) {
      ws!.disconnect();
    }
  }

  Future<void> getCurrentUser() async {
    try {
      _user.value = await _userProviders.currentUser();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void onWsEvent() {
    ws!.on('conversation', (data) {
      final MessageEntity message = MessageEntity.fromJson(data);
      if (Get.isRegistered<ConversationController>()) {
        ConversationController.to.onWsMessage(message);
      }
      if (Get.isRegistered<MessagesController>()) {
        MessagesController.to.onWsMessage(message);
      }
    });

    ws!.on('matching', (data) {
      Get.toNamed(
        AppRoutes.MATCHED,
        arguments: MatchUserEntity.fromJson(data),
      );
    });

    
  }
}
