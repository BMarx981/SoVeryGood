import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:so_very_good/src/editor_feature/editor_repository.dart';
import 'package:uuid/uuid.dart';

enum ShapeNames {
  circle,
  rectangle,
  ellipse,
  line,
  polyline,
  polygon,
  path,
}

class BaseWidget extends ConsumerStatefulWidget {
  final ShapeNames shape;
  final String id = const Uuid().v1();
  BaseWidget({required key, required this.shape}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends ConsumerState<BaseWidget> {
  double xPosition = 0;
  double yPosition = 0;
  double rotation = 0;
  double width = 0;
  double height = 0;
  double scale = 0.0;
  double lastRotation = 0;
  Offset xpos = Offset.zero;
  Offset ypos = Offset.zero;
  bool currentlySelected = false;
  final String svgTag =
      '<svg width="100" height="100" version="1.1" xmlns="http://www.w3.org/2000/svg">';
  String shape = '<circle cx="50" cy="50" r="50" fill="red"/></svg>';

  @override
  void initState() {
    switch (widget.shape) {
      case ShapeNames.circle:
        shape =
            '$svgTag<circle cx="50" cy="50" r="50" fill="red" fill-opacity=".5"/></svg>';
        break;
      case ShapeNames.rectangle:
        shape =
            '$svgTag<rect x="0" y="0"  rx="2" width="50" height="50"/></svg>';
        break;
      case ShapeNames.ellipse:
        shape = '$svgTag<ellipse cx="50" cy="50" rx="50" ry="100"/></svg>';
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
    final selectedOn = ref.watch(selectionToolProvider);
    if (!selectedOn) {
      setState(() => currentlySelected = false);
    }
    return Positioned(
      left: xPosition,
      top: yPosition,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedOn && currentlySelected
                ? Colors.black.withOpacity(.5)
                : Colors.transparent,
          ),
        ),
        child: Transform.rotate(
          alignment: FractionalOffset.center,
          angle: rotation / 3.14,
          child: GestureDetector(
            onTap: () {
              setState(() {
                currentlySelected = !currentlySelected;
              });
              if (selectedOn && currentlySelected) {
                ref.read(selectedProvider).addSelected(widget.id);
              }
            },
            onScaleUpdate: (details) {
              setState(() {
                rotation = details.rotation + rotation;
                debugPrint(rotation.toString());
                final offset = details.focalPoint;

                yPosition += details.focalPointDelta.dy;
                xPosition += details.focalPointDelta.dx;
                scale = details.scale;
              });
            },
            onLongPress: () {
              longPressed();
            },
            child: Column(
              children: [
                SvgPicture.string(shape),
              ],
            ),
          ),
        ),
      ),
    );
  }

  longPressed() {}
}
