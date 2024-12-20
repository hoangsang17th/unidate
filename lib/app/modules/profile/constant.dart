import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';

const int whenLoadMore = 1;

void showSnackbar(String content) {
  Get.closeCurrentSnackbar();
  Get.snackbar(
    "",
    '',
    snackPosition: SnackPosition.TOP,
    titleText: const SizedBox(),
    duration: const Duration(milliseconds: 1500),
    messageText: Text(
      content,
      style: AppTextStyles.body2,
    ),
  );
}
