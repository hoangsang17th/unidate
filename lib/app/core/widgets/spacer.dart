import 'package:flutter/widgets.dart';

class VSpacer extends StatelessWidget {
  final double size;
  const VSpacer(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}

class HSpacer extends StatelessWidget {
  final double size;
  const HSpacer(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size);
  }
}
