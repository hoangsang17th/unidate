import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:unidate/core/values/app_colors.dart';

class WaitingView extends StatefulWidget {
  const WaitingView({Key? key}) : super(key: key);

  @override
  State<WaitingView> createState() => _WaitingViewState();
}

class _WaitingViewState extends State<WaitingView> {
  @override
  void dispose() {
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      FlutterNativeSplash.remove();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:    AppBar(
        backgroundColor: AppColors.bgPaper,
        shadowColor: AppColors.transparent,
        elevation: 0,
      ),
    );
  }
}
