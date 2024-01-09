import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide MultipartFile;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:unidate/app/core/utils/get.storage.dart';
import 'package:unidate/app/modules/auth/entities/user.entity.dart';
import 'package:unidate/app/modules/auth/user.provider.dart';

class RegisterController extends GetxController {
  final UserProviders _userProviders = UserProviders();

  final Rx<RegisterEntity> _user = RegisterEntity().obs;
  RegisterEntity get user => _user.value;

  bool isSubmitted = false;

  void setEmail(String email) {
    _user.update((val) {
      val!.email = email;
    });
  }

  void setPassword(String password) {
    _user.update((val) {
      val!.password = password;
    });
  }

  void setFullName(String fullName) {
    _user.update((val) {
      val!.fullname = fullName;
    });
  }

  Future<void> setAvatar() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.media,
    );

    if (result != null) {
      _user.update((val) {
        val!.avatarFile = File(result.files.single.path!);
      });
    } else {
      Get.snackbar('Warning', 'No image selected');
    }
  }

  Future<void> onRegister() async {
    if (isSubmitted) return;
    isSubmitted = true;

    if (!user.isValid) {
      Get.snackbar('Error', 'Form is invalid');
      isSubmitted = false;
      return;
    } else {
      try {
        EasyLoading.show(status: 'Waiting...');
        final avatarPath = _user.value.avatarFile!.path;
        final avatar = await MultipartFile.fromFile(
          avatarPath,
          contentType: MediaType.parse(
            lookupMimeType(avatarPath).toString(),
          ),
        );
        _user.value.avatar = avatar;
        final res = await _userProviders.register(user);
        AppGetStorage.instance.write(
          AppGetKey.accessToken,
          res.accessToken,
        );
        res.nextStep.navigation();
      } catch (e) {
        Get.snackbar('Error', 'Đăng ký thất bại');
        debugPrint(e.toString());
      }
    }
    EasyLoading.dismiss();
    isSubmitted = false;
  }
}
