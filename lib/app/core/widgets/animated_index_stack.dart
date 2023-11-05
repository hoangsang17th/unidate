// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

class AnimatedIndexStack extends StatefulWidget {
  final int index;
  final List<Widget> children;

  const AnimatedIndexStack({
    Key? key,
    required this.index,
    required this.children,
  }) : super(key: key);

  @override
  AnimatedIndexStackState createState() => AnimatedIndexStackState();
}

class AnimatedIndexStackState extends State<AnimatedIndexStack> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: LazyLoadIndexedStack(
        index: widget.index,
        children: widget.children,
      ),
    );
  }
}
