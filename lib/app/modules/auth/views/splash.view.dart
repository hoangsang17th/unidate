import 'package:flutter/material.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/generated/assets.gen.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
            child: AppSvgPicture(
      AppAssets.images.splash,
      size: 100,
    )));
  }
}
