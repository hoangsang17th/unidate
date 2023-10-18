import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSvgPicture extends StatelessWidget {
  const AppSvgPicture(
    this.svg, {
    super.key,
    required this.size,
    this.color,
    this.radius,
  });
  final String svg;
  final double? size;

  /// Default color is AppColors.textSecondary
  final Color? color;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return radius != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(radius!),
            child: _buildBody(),
          )
        : _buildBody();
  }

  Widget _buildBody() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SvgPicture.asset(
        svg,
        color: color,
        height: size,
        width: size,
      ),
    );
  }
}
