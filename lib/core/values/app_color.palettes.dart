// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class AppColorPalettes {
  AppColorPalettes._();

  /// Primary
  static const Color primaryLight = Color(0xff22D197);
  static const Color primary = Color(0xff0D8972);
  static const Color primaryDark = Color.fromARGB(255, 4, 106, 87);

  // Secondary
  static const Color secondaryLight = Color(0xFFE6E6E6);
  static const Color secondary = Color(0xFFCCCCCC);
  static const Color secondaryDark = Color(0xFFB3B3B3);
  static const Color secondaryDarker = Color(0xFF999999);

  // Info
  static const Color successLight = Color(0xFFB2FFB2);
  static const Color success = Color(0xFF00AB54);
  static const Color successDark = Color(0xFF009900);
  static const Color successDarker = Color(0xFF007A3D);

  // Success
  static const Color infoLight = Color(0xFF80B2FF);
  static const Color info = Color(0xFF4D9EFF);
  static const Color infoDark = Color(0xFF0066CC);
  static const Color infoDarker = Color(0xFF004C99);

  // Warning
  static const Color warningLight = Color(0xFFFFE380);
  static const Color warning = Color(0xFFFFC700);
  static const Color warningDark = Color(0xFFFFA000);
  static const Color warningDarker = Color(0xFFCC7A00);

  // Error
  static const Color errorLight = Color(0xFFFFB2B2);
  static const Color error = Color(0xFFFF3333);
  static const Color errorDark = Color(0xFFCC0000);
  static const Color errorDarker = Color(0xFF990000);

  // Grey
  static const ColorSwatch grey = ColorSwatch(
    0xFF919EAB,
    <int, Color>{
      100: Color(0xFFF9FAFB),
      200: Color(0xFFF4F6F8),
      300: Color(0xFFDFE3E8),
      400: Color(0xFFC4CDD5),
      500: Color(0xFF919EAB),
      600: Color(0xFF637381),
      700: Color(0xFF454F5B),
      800: Color(0xFF212B36),
      900: Color(0xFF161C24),
    },
  );

  // Transparent
  static Color withOpacity(
    Color color,
    AppTransparentOpacity opacity,
  ) {
    late String opacityValue;
    switch (opacity) {
      case AppTransparentOpacity.zero:
        opacityValue = '00';
        break;
      case AppTransparentOpacity.eight:
        opacityValue = '14';
        break;
      case AppTransparentOpacity.twelve:
        opacityValue = '1F';
        break;
      case AppTransparentOpacity.sixteen:
        opacityValue = '29';
        break;
      case AppTransparentOpacity.twenty:
        opacityValue = '33';
        break;
      case AppTransparentOpacity.twentyFour:
        opacityValue = '3D';
        break;
      case AppTransparentOpacity.thirtyTwo:
        opacityValue = '52';
        break;
      case AppTransparentOpacity.fortyEight:
        opacityValue = '7A';
        break;
      case AppTransparentOpacity.oneHundred:
        opacityValue = 'FF';
        break;
    }

    String newColor =
        color.value.toRadixString(16).replaceRange(0, 2, '0x$opacityValue');

    return Color(int.parse(newColor));
  }
}

enum AppTransparentOpacity {
  /// 0% Opacity
  zero,

  /// 8% Opacity
  eight,

  /// 12% Opacity
  twelve,

  /// 16% Opacity
  sixteen,

  /// 20% Opacity
  twenty,

  /// 24% Opacity
  twentyFour,

  /// 32% Opacity
  thirtyTwo,

  /// 48% Opacity
  fortyEight,

  /// 100% Opacity
  oneHundred;
}
