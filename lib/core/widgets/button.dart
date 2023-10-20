import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      backgroundColor: const Color(0xff2AAC7A),
      textColor: Colors.white,
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
      backgroundColor: Colors.white,
      textColor: const Color(0xff2AAC7A),
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
        padding: const EdgeInsets.all(16),
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
