import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/core/widgets/button.dart';
import 'package:unidate/core/widgets/image.dart';
import 'package:unidate/core/widgets/spacer.dart';
import 'package:unidate/generated/assets.gen.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff22D197),
              Color(0xff0D8972),
            ],
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              AppAssets.images.auth.member.path,
              fit: BoxFit.fitWidth,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 50),
              child: Column(
                children: [
                  VSpacer(12),
                  Text(
                    'Find your partner in life',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  VSpacer(12),
                  Text(
                    'We created to bring together amazing singles who want to find love, laughter and happily ever after! ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  VSpacer(60),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SecondaryButton(
                onPressed: () => Get.toNamed(AppRoutes.REGISTER),
                text: 'Join now',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have account? '),
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.LOGIN),
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
