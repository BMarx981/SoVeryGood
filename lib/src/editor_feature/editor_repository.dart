import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:so_very_good/src/drawable_objects.dart/base_widget.dart';
import 'package:so_very_good/src/drawable_objects.dart/circle.dart';

class ImageObjectsList extends StateNotifier<List<BaseWidget>> {
  ImageObjectsList() : super(const []);

  String dPrint(List<BaseWidget> list) {
    String s = " list :";
    for (final ele in list) {
      s += ' ${ele.id.toString().substring(0, 8)} ';
    }
    return s;
  }

  deleteItem(String id) {
    state = [
      for (final item in state)
        if (item.id != id) item
    ];
  }

  showUuids() {
    for (BaseWidget b in state) {
      debugPrint(b.id.toString());
    }
  }

  addWidget(ShapeNames shape) {
    BaseWidget widgetShape = BaseWidget(shape: ShapeNames.rectangle);
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
    // debugPrint(widgetShape.id.toString());
  }
}

final imageObjectProvider =
    StateNotifierProvider<ImageObjectsList, List<Widget>>((ref) {
  final selectIds = ref.watch(selectedProvider);

  return ImageObjectsList();
});

class SelectedId {
  List<String> selected = [];

  addSelected(String id) {
    selected.add(id);
    debugPrint(id);
  }

  clearSelected() {
    selected.clear();
  }
}

final selectedProvider = Provider<SelectedId>((ref) => SelectedId());

class SelectionTool extends StateNotifier<bool> {
  bool _selectedOn = false;

  SelectionTool() : super(false);
  toggleSelection() {
    _selectedOn = !_selectedOn;
    state = _selectedOn;
  }

  bool get selection => state;
}

final selectionToolProvider =
    StateNotifierProvider<SelectionTool, bool>((ref) => SelectionTool());

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
