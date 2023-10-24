import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unidate/core/values/app_colors.dart';

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
        padding: const EdgeInsets.all(12),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              letterSpacing: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
