import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:so_very_good/src/drawable_objects.dart/base_widget.dart';
import 'package:so_very_good/src/drawable_objects.dart/circle.dart';

class ImageObjectsList extends StateNotifier<List<Widget>> {
  ImageObjectsList() : super(const []);

  // deleteItem(String id) {
  //   state = [
  //     for (final item in state)
  //       if (item.id != id) item
  //   ];
  // }

  addWidget(ShapeNames shape) {
    Widget widgetShape = Container();
    switch (shape) {
      case ShapeNames.circle:
        CircleSVG shape = CircleSVG();
        widgetShape = shape.getShapeWidget();
        break;
      case ShapeNames.rectangle:
        widgetShape = BaseWidget(shape: ShapeNames.rectangle);
        break;
      case ShapeNames.ellipse:
        widgetShape = BaseWidget(shape: ShapeNames.ellipse);
        break;
      case ShapeNames.line:
        widgetShape = BaseWidget(shape: ShapeNames.line);
        break;
      case ShapeNames.polyline:
        widgetShape = BaseWidget(shape: ShapeNames.polyline);
        break;
      case ShapeNames.path:
        widgetShape = BaseWidget(shape: ShapeNames.path);
        break;
      case ShapeNames.polygon:
        widgetShape = BaseWidget(shape: ShapeNames.polygon);
        break;
      default:
        break;
    }
    state = [...state, widgetShape];
  }
}

final imageObjectProvider =
    StateNotifierProvider<ImageObjectsList, List<Widget>>((ref) {
  return ImageObjectsList();
});

class PanOn extends StateNotifier<bool> {
  bool _panOn = false;

  PanOn() : super(false);
  togglePan() {
    _panOn = !_panOn;
    state = _panOn;
  }

  bool get pan => _panOn;
}

final panOnStateProvider = StateNotifierProvider<PanOn, bool>((ref) => PanOn());
