// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unidate/app/core/widgets/image.dart';

class AppGridView extends StatelessWidget {
  final List<String> images;

  const AppGridView({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        pattern: [
          const WovenGridTile(1),
          const WovenGridTile(1),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount: images.length,
        (context, index) => AppNetworkPicture(
          images[index],
          radius: 16,
        ),
      ),
    );
  }
}
