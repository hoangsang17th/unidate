import 'package:flutter/material.dart';
import 'package:unidate/app/core/values/app_colors.dart';

class WaitingView extends StatefulWidget {
  const WaitingView({Key? key}) : super(key: key);

  @override
  State<WaitingView> createState() => _WaitingViewState();
}

class _WaitingViewState extends State<WaitingView> {
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
