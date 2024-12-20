import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidate/app/core/widgets/image.dart';
import 'package:unidate/app/modules/auth/controllers/register.controller.dart';
import 'package:unidate/app/core/widgets/app_bar.dart';
import 'package:unidate/app/core/widgets/app_text_field.dart';
import 'package:unidate/app/core/widgets/button.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:unidate/generated/assets.gen.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSystem(
        title: 'Register',
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Obx(
                    () => controller.user.avatarFile != null
                        ? AppAssetPicture(
                          controller.user.avatarFile!,
                            width: 100,
                            height: 120,
                            radius: 12,
                          )
                        : AppImagePicture(
                            AppAssets.images.users.defaultUser,
                            width: 100,
                            height: 120,
                            radius: 12,
                          ),
                  ),
                  const HSpacer(12),
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () => controller.setAvatar(),
                      text: 'Change avatar',
                    ),
                  ),
                ],
              ),
              const VSpacer(24),
              AppInput(
                placeHolder: 'Phạm Hoàng Sang',
                label: 'Full name',
                onChanged: (_) => controller.setFullName(_),
              ),
              const VSpacer(12),
              AppInput(
                placeHolder: 'dev@finfree.com',
                label: 'Email address',
                onChanged: (_) => controller.setEmail(_),
              ),
              const VSpacer(12),
              AppInput(
                placeHolder: '********',
                label: 'Password',
                onChanged: (_) => controller.setPassword(_),
              ),
              const VSpacer(12),
              PrimaryButton(
                onPressed: () => controller.onRegister(),
                text: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
