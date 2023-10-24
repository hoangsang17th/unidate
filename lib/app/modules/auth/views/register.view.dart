import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/routes/app_pages.dart';
import 'package:unidate/core/widgets/app_bar.dart';
import 'package:unidate/core/widgets/app_text_field.dart';
import 'package:unidate/core/widgets/button.dart';
import 'package:unidate/core/widgets/spacer.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSystem(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const AppInput(
              placeHolder: 'Phạm Hoàng Sang',
              label: 'Full name',
            ),
            const VSpacer(12),
            const AppInput(
              placeHolder: '0xxxxxxxxx',
              label: 'Phone number',
            ),
            const VSpacer(12),
            const AppInput(
              placeHolder: 'dev@finfree.com',
              label: 'Email address',
            ),
            const VSpacer(12),
            const AppInput(
              placeHolder: '********',
              label: 'Password',
            ),
            // Giới tính - Độ tuổi
            // Giới thiệu bản thân
            // Địa chỉ
            // Trường học
            const VSpacer(12),
            PrimaryButton(
              onPressed: () => Get.toNamed(AppRoutes.SETUP_PROFILE),
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
