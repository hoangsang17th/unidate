import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

enum AppGetKey { accessToken, accessTokenExpired, refreshTokenExpired }

class AppGetStorage {
  AppGetStorage._();
  static AppGetStorage get instance => AppGetStorage._();

  static late GetStorage getStorage;

  Future<void> init() async {
    try {
      GetStorage('UniDate');
      await GetStorage.init();

      getStorage = GetStorage();
    } catch (e) {
      debugPrint('Can\'t init the GetStorage');
    }
  }

  Future<void> write(
    AppGetKey key,
    dynamic value,
  ) async {
    try {
      await getStorage.write(key.name, value);
    } catch (e) {
      debugPrint('Can\'t write the GetStorage');
    }
  }

  Future<dynamic> read(AppGetKey key) async {
    try {
      dynamic value = await getStorage.read(key.name);
      return value;
    } catch (e) {
      debugPrint('Can\'t read the GetStorage');
    }
  }

  Future<void> delete(AppGetKey key) async {
    try {
      await getStorage.remove(key.name);
    } catch (e) {
      debugPrint('Can\'t delete the GetStorage');
    }
  }

  Future<void> deleteAll() async {
    try {
      await getStorage.erase();
    } catch (e) {
      debugPrint('Can\'t delete the GetStorage');
    }
  }
}
