import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unidate/app/modules/profile/views/settings.view.dart';
import 'package:unidate/generated/assets.gen.dart';

class AppSvgPicture extends StatelessWidget {
  const AppSvgPicture(
    this.svg, {
    super.key,
    this.size,
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
    return SvgPicture.asset(
      svg,
      height: size,
      width: size,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}

class AppImagePicture extends StatelessWidget {
  final AssetGenImage image;
  final double? height;
  final double? width;
  final double? radius;

  const AppImagePicture(
    this.image, {
    super.key,
    this.height,
    this.radius,
    this.width,
  });

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
    return Image.asset(
      image.path,
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}

class AppNetworkPicture extends StatelessWidget {
  const AppNetworkPicture(
    this.url, {
    super.key,
    this.height,
    this.radius = 4,
    this.width,
    this.canZoom = false,
  });

  final String url;
  final double? height;
  final double? width;
  final double radius;
  final bool canZoom;

  @override
  Widget build(BuildContext context) {
return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => _buildImage(imageProvider),
      placeholder: height != null && width != null
          ? (context, url) => AppShimmer(height: height!, width: width!)
          : null,
    );
  }

  Widget _buildImage(ImageProvider imageProvider) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image(
        image: imageProvider,
        fit: BoxFit.cover,
        height: height,
        width: width,
      ),
    );
  }
}

class AppAssetPicture extends StatelessWidget {
  final File file;
  final double? height;
  final double? width;
  final double? radius;

  const AppAssetPicture(
    this.file, {
    super.key,
    this.height,
    this.radius,
    this.width,
  });

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
    return Image.file(
      file,
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}
