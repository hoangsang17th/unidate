import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:unidate/app/modules/auth/entities/user.entity.dart';
import 'package:unidate/app/modules/auth/profile.provider.dart';

class SetupLocationController extends GetxController {
  final ProfileProviders _profileProviders = ProfileProviders();

  Future<void> allowLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Get.snackbar(
        'Location permission',
        'Location services are disabled.',
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        Get.snackbar(
          'Location permission',
          'Location permissions are denied',
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Get.snackbar(
        'Location permission',
        'Location permissions are permanently denied, we cannot request permissions.',
      );
      return;
    }
    EasyLoading.show();
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final posi = await Geolocator.getCurrentPosition();
    
    try {
      final res = await _profileProviders.updateLocation(UpdateLocationEntity(
        lat: posi.latitude,
        long: posi.longitude,
      ));
      res.nextStep.navigation();
    } catch (e) {
      Get.snackbar('Location Error', 'Can\'t update your location');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
