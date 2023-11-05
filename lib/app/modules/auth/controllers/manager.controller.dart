import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/http/helper.http.dart';
import 'package:unidate/app/core/utils/get.storage.dart';
import 'package:unidate/app/data/providers/user.provider.dart';
import 'package:unidate/app/routes/app_pages.dart';

class ManagerController extends GetxController {
  final UserProviders userProviders = UserProviders();

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  _init() async {
    try {
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
      );

      AppHttpHelper.instance.init();
      await AppGetStorage.instance.init();
      _navigate();
      FlutterNativeSplash.remove();
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  void _navigate() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final accessToken = await AppGetStorage.instance.read(
        AppGetKey.accessToken,
      );
      if (accessToken != null) {
        final res = await userProviders.currentUser();

        res.nextStep.navigation();
      } else {
        Get.offAndToNamed(AppRoutes.WELCOME);
      }
    });
  }
}
