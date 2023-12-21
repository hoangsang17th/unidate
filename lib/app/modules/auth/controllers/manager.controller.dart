import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/http/helper.http.dart';
import 'package:unidate/app/core/utils/get.storage.dart';
import 'package:unidate/app/modules/auth/user.provider.dart';
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

  Future<void> _navigate() async {
    final accessToken = await AppGetStorage.instance.read(
      AppGetKey.accessToken,
    );
    //
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (accessToken != null) {
        debugPrint('accessToken: $accessToken');
        final res = await userProviders.currentUser();

        try {
          res.nextStep.navigation();
        } catch (e) {
          Get.offAndToNamed(AppRoutes.WELCOME);
        }
      } else {
        Get.offAndToNamed(AppRoutes.WELCOME);
      }
    });
  }
}
