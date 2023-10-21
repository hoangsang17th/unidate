import 'package:flutter/material.dart';
import 'package:unidate/core/values/app_colors.dart';
import 'package:unidate/core/widgets/spacer.dart';
import 'package:unidate/generated/assets.gen.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const VSpacer(72),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              height: 72,
              width: 72,
              child: AppAssets.images.users.user4.image(
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Row(
            children: [
              // Lượt thích
              // Lượt ghé thăm
              // Lượt kết nối
            ],
          ),
          const VSpacer(72),
          // My Photos
          // Edit profile
          // Notifications
          // Invite friends
          // Logout

          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.divider,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              child: const Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 16),
                  Text('Account'),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
