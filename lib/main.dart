import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unidate/core/configure/setup.configure.dart';
import 'package:unidate/core/values/app_scroll_behavior.dart';
import './app/routes/app_pages.dart';

void main() {
  configureSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
      ),
    );
    return GetMaterialApp(
      title: 'Flutter Demo',
      scrollBehavior: const AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
