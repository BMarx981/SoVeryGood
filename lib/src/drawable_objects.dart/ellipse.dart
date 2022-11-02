import 'package:flutter/cupertino.dart';
import 'package:so_very_good/src/drawable_objects.dart/base_shape.dart';
import 'package:so_very_good/src/drawable_objects.dart/base_widget.dart';

class EllipseSVG extends BaseShape {
  int ry = 0;
  int rx = 0;
  int cy = 0;
  int cx = 0;
  BaseWidget shapeWidget = BaseWidget(
    shape: ShapeNames.circle,
    key: UniqueKey,
  );

  BaseWidget getShapeWidget() {
    return shapeWidget;
  }
}
