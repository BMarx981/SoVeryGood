import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseWidget extends ConsumerStatefulWidget {
  const BaseWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends ConsumerState<BaseWidget> {
  double xPosition = 0;
  double yPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: xPosition,
      top: yPosition,
      child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              xPosition += details.delta.dx;
              yPosition += details.delta.dy;
            });
          },
          child: const SizedBox(
              height: 100, width: 100, child: Text("Say something"))),
    );
  }
}
