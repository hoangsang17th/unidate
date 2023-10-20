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
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.2,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildButton(AppAssets.icons.navigationBar.home),
            _buildButton(AppAssets.icons.navigationBar.heart),
            _buildButton(AppAssets.icons.navigationBar.chat),
            _buildButton(AppAssets.icons.navigationBar.profile),
          ],
        ),
      ),
    );
  }

  InkWell _buildButton(String icon) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: AppSvgPicture(icon),
      ),
    );
  }
}
