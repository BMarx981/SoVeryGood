import 'package:flutter/material.dart';
import 'package:so_very_good/src/drawable_objects.dart/base_shape.dart';
import 'package:so_very_good/src/drawable_objects.dart/base_widget.dart';

class CircleSVG extends BaseShape {
  int r = 0;
  int cy = 0;
  int cx = 0;
  BaseWidget shapeWidget = BaseWidget(
    key: UniqueKey(),
    shape: ShapeNames.circle,
  );

  BaseWidget getShapeWidget() {
    return shapeWidget;
  }
}
