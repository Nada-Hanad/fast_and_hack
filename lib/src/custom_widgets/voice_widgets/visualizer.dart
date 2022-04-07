import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:flutter/material.dart';

class VoiceVisualizer extends StatefulWidget {
  final int duration;
  const VoiceVisualizer(
      {Key? key, required Color color, required this.duration})
      : super(key: key);

  @override
  State<VoiceVisualizer> createState() => _VoiceVisualizerState();
}

class _VoiceVisualizerState extends State<VoiceVisualizer>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animController;
  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );
    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: animController,
      curve: Curves.easeInOutCubic,
    );
    animation = Tween<double>(begin: 0, end: 100).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    animController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7,
      decoration: BoxDecoration(
        color: beige,
        borderRadius: BorderRadius.circular(0),
      ),
      height: animation.value,
    );
  }
}
