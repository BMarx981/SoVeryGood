import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseWidget extends StatefulWidget {
  const BaseWidget({super.key});

  @override
  State<StatefulWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  double xPosition = 0;
  double yPosition = 0;
  String shape =
      '<svg width="200" height="250" version="1.1" xmlns="http://www.w3.org/2000/svg"><circle cx="50" cy="50" r="50" fill="red"/></svg>';

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
          child: SvgPicture.string(shape)),
    );
  }
}
