/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add.svg
  String get add => 'assets/icons/add.svg';

  /// File path: assets/icons/adjust-horizontal-settings.svg
  String get adjustHorizontalSettings =>
      'assets/icons/adjust-horizontal-settings.svg';

  /// File path: assets/icons/chevron.left.svg
  String get chevronLeft => 'assets/icons/chevron.left.svg';

  /// File path: assets/icons/dislike.svg
  String get dislike => 'assets/icons/dislike.svg';

  /// File path: assets/icons/like.svg
  String get like => 'assets/icons/like.svg';

  /// File path: assets/icons/location.svg
  String get location => 'assets/icons/location.svg';

  /// File path: assets/icons/logo.svg
  String get logo => 'assets/icons/logo.svg';

  $AssetsIconsNavigationBarGen get navigationBar =>
      const $AssetsIconsNavigationBarGen();

  /// File path: assets/icons/notification.svg
  String get notification => 'assets/icons/notification.svg';

  /// List of all assets
  List<String> get values => [
        add,
        adjustHorizontalSettings,
        chevronLeft,
        dislike,
        like,
        location,
        logo,
        notification
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesAuthGen get auth => const $AssetsImagesAuthGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/native_splash.png
  AssetGenImage get nativeSplash =>
      const AssetGenImage('assets/images/native_splash.png');

  $AssetsImagesUsersGen get users => const $AssetsImagesUsersGen();

  /// List of all assets
  List<AssetGenImage> get values => [logo, nativeSplash];
}

class $AssetsIconsNavigationBarGen {
  const $AssetsIconsNavigationBarGen();

  /// File path: assets/icons/navigation_bar/Chat.svg
  String get chat => 'assets/icons/navigation_bar/Chat.svg';

  /// File path: assets/icons/navigation_bar/Heart.svg
  String get heart => 'assets/icons/navigation_bar/Heart.svg';

  /// File path: assets/icons/navigation_bar/Home.svg
  String get home => 'assets/icons/navigation_bar/Home.svg';

  /// File path: assets/icons/navigation_bar/Profile.svg
  String get profile => 'assets/icons/navigation_bar/Profile.svg';

  /// List of all assets
  List<String> get values => [chat, heart, home, profile];
}

class $AssetsImagesAuthGen {
  const $AssetsImagesAuthGen();

  /// File path: assets/images/auth/member.svg
  String get member => 'assets/images/auth/member.svg';

  /// File path: assets/images/auth/title.svg
  String get title => 'assets/images/auth/title.svg';

  /// List of all assets
  List<String> get values => [member, title];
}

class $AssetsImagesUsersGen {
  const $AssetsImagesUsersGen();

  /// File path: assets/images/users/user1.jpg
  AssetGenImage get user1 =>
      const AssetGenImage('assets/images/users/user1.jpg');

  /// File path: assets/images/users/user2.jpg
  AssetGenImage get user2 =>
      const AssetGenImage('assets/images/users/user2.jpg');

  /// File path: assets/images/users/user3.jpg
  AssetGenImage get user3 =>
      const AssetGenImage('assets/images/users/user3.jpg');

  /// File path: assets/images/users/user4.jpg
  AssetGenImage get user4 =>
      const AssetGenImage('assets/images/users/user4.jpg');

  /// File path: assets/images/users/user5.jpeg
  AssetGenImage get user5 =>
      const AssetGenImage('assets/images/users/user5.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [user1, user2, user3, user4, user5];
}

class AppAssets {
  AppAssets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
