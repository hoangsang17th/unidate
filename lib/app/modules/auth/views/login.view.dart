import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/modules/auth/controllers/login.controller.dart';
import 'package:unidate/core/values/app_colors.dart';
import 'package:unidate/core/values/app_text_styles.dart';
import 'package:unidate/core/widgets/app_bar.dart';
import 'package:unidate/core/widgets/app_text_field.dart';
import 'package:unidate/core/widgets/button.dart';

import 'package:unidate/core/widgets/image.dart';
import 'package:unidate/core/widgets/spacer.dart';
import 'package:unidate/generated/assets.gen.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPaper,
      resizeToAvoidBottomInset: true,
      appBar: const AppBarSystem(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.2,
              child: AppSvgPicture(AppAssets.images.auth.title),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.bg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Login',
                    style: AppTextStyles.h3,
                  ),
                  const VSpacer(24),
                  const AppInput(
                    placeHolder: 'phsang@gmail.com',
                    label: 'Email',
                  ),
                  const VSpacer(12),
                  const AppInput(
                    placeHolder: '***',
                    label: 'Password',
                    obscureText: true,
                  ),
                  const VSpacer(12),
                  PrimaryButton(
                    onPressed: controller.onLogin,
                    text: 'Login',
                  ),
                  const VSpacer(24),
                  Material(
                    color: AppColors.transparent,
                    child: InkWell(
                      onTap: controller.onRegister,
                      borderRadius: BorderRadius.circular(16),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Text(
                          'Don\'t have an account? Sign up',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const VSpacer(12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
