import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_scroll_behavior.dart';
import './app/routes/app_pages.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> main() async {
   await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        scrollBehavior: const AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        builder: EasyLoading.init(),
      ),
    );
  }
}
