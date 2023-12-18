import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:unidate/app/modules/auth/entities/user.entity.dart';
import 'package:unidate/app/modules/auth/profile.provider.dart';

class AddPicturesController extends GetxController {
  final ProfileProviders _profileProviders = ProfileProviders();

  Rx<PicturesEntity> pictures = PicturesEntity(
    pictures: [],
    picturesFile: [],
  ).obs;

  bool isSubmitted = false;

  Future<void> pickImage(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
    pictures.value.picturesFile.add(PictureIndex(
      index: index,
      file: File(result!.files.single.path!),
    ));
    pictures.refresh();
  }

  void removeImage(int index) {
    pictures.value.picturesFile
        .removeWhere((element) => element.index == index);
    pictures.refresh();
  }

  Future<void> onAddPictures() async {
    if (pictures.value.isValid) {
      Get.snackbar('Miximun', 'Tối thiểu phải thêm 3 ảnh');
      return;
    }
    if (isSubmitted) return;
    isSubmitted = true;
    try {
      EasyLoading.show(status: 'Waiting...');
      await pictures.value.convertFile();
      final res = await _profileProviders.addPictures(pictures.value);
      res.nextStep.navigation();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      EasyLoading.dismiss();
      isSubmitted = false;
    }
  }

  File? picture(index) {
    return pictures.value.picturesFile
        .firstWhereOrNull((element) => element.index == index)
        ?.file;
  }
}
