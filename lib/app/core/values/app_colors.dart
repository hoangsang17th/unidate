// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../values/app_color.palettes.dart';

class AppColors {
  AppColors._();

  static const primaryLight = AppColorPalettes.primaryLight;
  static const primary = AppColorPalettes.primary;
  static const primaryDark = AppColorPalettes.primaryDark;

  static const secondaryLight = AppColorPalettes.secondaryLight;
  static const secondary = AppColorPalettes.secondary;
  static const secondaryDark = AppColorPalettes.secondaryDark;

  static const successLight = AppColorPalettes.successLight;
  static const success = AppColorPalettes.success;
  static const successDark = AppColorPalettes.successDark;

  static const infoLight = AppColorPalettes.infoLight;
  static const info = AppColorPalettes.info;
  static const infoDark = AppColorPalettes.infoDark;

  static const warningLight = AppColorPalettes.warningLight;
  static const warning = AppColorPalettes.warning;
  static const warningDark = AppColorPalettes.warningDark;

  static const errorLight = AppColorPalettes.errorLight;
  static const error = AppColorPalettes.error;
  static const errorDark = AppColorPalettes.errorDark;

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const transparent = Colors.transparent;

  static const bg = white;
  static final bgPaper = AppColorPalettes.grey[100]!;
  static final bgNeutral = AppColorPalettes.grey[200]!;
  static final bgContrast = AppColorPalettes.grey[900]!;

  static final fillFocus = AppColorPalettes.withOpacity(
    AppColorPalettes.grey,
    AppTransparentOpacity.twelve,
  );
  static final fillUnfocused = AppColorPalettes.withOpacity(
    AppColorPalettes.grey,
    AppTransparentOpacity.eight,
  );
  static final fillDisabled = AppColorPalettes.withOpacity(
    AppColorPalettes.grey,
    AppTransparentOpacity.sixteen,
  );

  static final textPrimary = AppColorPalettes.grey[800]!;
  static final textSecondary = AppColorPalettes.grey[600]!;
  static final textDisabled = AppColorPalettes.grey[400]!;
  static final textHint = AppColorPalettes.grey[300]!;
  static final textContrast = AppColorPalettes.grey[100]!;
  static final textBtnPrimary = AppColorPalettes.grey[100]!;

  static final divider = AppColorPalettes.withOpacity(
    AppColorPalettes.grey,
    AppTransparentOpacity.twentyFour,
  );

  static final process = AppColorPalettes.withOpacity(
    AppColorPalettes.grey,
    AppTransparentOpacity.twentyFour,
  );
  static final processValue = AppColorPalettes.withOpacity(
    AppColorPalettes.grey,
    AppTransparentOpacity.thirtyTwo,
  );

  static final border = AppColorPalettes.withOpacity(
    AppColorPalettes.grey,
    AppTransparentOpacity.fortyEight,
  );

  static const hyperLink = AppColorPalettes.primaryDark;

  static final tab = AppColorPalettes.withOpacity(
    AppColorPalettes.grey,
    AppTransparentOpacity.eight,
  );
}
