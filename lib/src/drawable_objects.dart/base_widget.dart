import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ShapeNames {
  circle,
  rectangle,
  ellipse,
  line,
  polyline,
  polygon,
  path,
}

class BaseWidget extends StatefulWidget {
  final ShapeNames shape;
  const BaseWidget({super.key, required this.shape});

  @override
  State<StatefulWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  double xPosition = 0;
  double yPosition = 0;
  final String svgTag =
      '<svg width="200" height="250" version="1.1" xmlns="http://www.w3.org/2000/svg">';
  String shape =
      '<svg width="200" height="250" version="1.1" xmlns="http://www.w3.org/2000/svg"><circle cx="50" cy="50" r="50" fill="red"/></svg>';

  @override
  void initState() {
    switch (widget.shape) {
      case ShapeNames.circle:
        shape = '$svgTag<circle cx="50" cy="50" r="50" fill="red"/></svg>';
        break;
      case ShapeNames.rectangle:
        shape =
            '$svgTag<rect x="60" y="10" rx="10" ry="10" width="30" height="30"/></svg>';
        break;
      case ShapeNames.ellipse:
        shape = '$svgTag<ellipse cx="75" cy="75" rx="20" ry="5"/></svg>';
        break;
      case ShapeNames.line:
        shape =
            '$svgTag<line x1="10" x2="50" y1="110" y2="150" stroke="black" stroke-width="5"/></svg>';
        break;
      case ShapeNames.polyline:
        shape =
            '$svgTag<polyline points="60, 110 65, 120 70, 115 75, 130 80, 125 85, 140 90, 135 95, 150 100, 145"/></svg>';
        break;
      case ShapeNames.polygon:
        shape =
            '$svgTag<polygon points="50, 160 55, 180 70, 180 60, 190 65, 205 50, 195 35, 205 40, 190 30, 180 45, 180"/></svg>';
        break;
      case ShapeNames.path:
        shape =
            '$svgTag<path d="M20,230 Q40,205 50,230 T90,230" fill="none" stroke="blue" stroke-width="5"/></svg>';
        break;
    }
    super.initState();
  }

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
