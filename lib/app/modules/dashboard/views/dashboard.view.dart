import 'package:flutter/material.dart';
import 'package:unidate/app/modules/dashboard/views/cards_stack_widget.dart';
import 'package:unidate/core/widgets/image.dart';
import 'package:unidate/generated/assets.gen.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('DashBoardView'),
      ),
      body: const CardsStackWidget(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.2,
            ),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildButton(AppAssets.icons.navigationBar.home, true),
            _buildButton(AppAssets.icons.navigationBar.heart, false),
            _buildButton(AppAssets.icons.navigationBar.chat, false),
            _buildButton(AppAssets.icons.navigationBar.profile, false),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String icon, bool isActive) {
    return Material(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: AppSvgPicture(
            icon,
            size: 24,
            color: isActive ? const Color(0xff2AAC7A) : null,
          ),
        ),
      ),
    );
  }
}
