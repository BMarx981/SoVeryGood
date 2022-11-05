import 'package:so_very_good/src/drawable_objects.dart/base_shape.dart';

class Rect extends BaseShape {
  double rx = 0;
  double ry = 0;

  String get getShape => shape;

  setWidth(double w) {
    shape = '<rect x="0" y="0"  rx="2" width="$w" height="$height"/></svg>';
  }

  setHeight(double h) {
    shape = '<rect x="0" y="0"  rx="2" width="$width" height="$h"/></svg>';
  }
}
