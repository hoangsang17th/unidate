import 'package:flutter/material.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return _Button(
      onPressed: onPressed,
      text: text,
      backgroundColor: AppColors.primary,
      textColor: AppColors.white,
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return _Button(
      onPressed: onPressed,
      text: text,
      backgroundColor: AppColors.white,
      textColor: AppColors.primary,
    );
  }
}

class _Button extends StatelessWidget {
  final Function() onPressed;
  final Color textColor;
  final Color backgroundColor;
  final String text;
  const _Button({
    required this.onPressed,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        maximumSize: const Size.fromWidth(400),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.body1.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
