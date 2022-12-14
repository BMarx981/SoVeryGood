import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:so_very_good/src/drawable_objects.dart/base_widget.dart';
import 'package:so_very_good/src/drawable_objects.dart/circle.dart';

class ImageObjectsList extends StateNotifier<List<BaseWidget>> {
  ImageObjectsList() : super(const []);

  deleteItems(List<String> list) {
    for (final str in list) {
      deleteItem(str);
    }
  }

  deleteItem(String id) {
    state = [
      for (final item in state)
        if (item.id != id) item
    ];
  }

  addWidget(ShapeNames shape) {
    BaseWidget widgetShape =
        BaseWidget(key: UniqueKey(), shape: ShapeNames.rectangle);
    switch (shape) {
      case ShapeNames.circle:
        CircleSVG shape = CircleSVG();
        widgetShape = shape.getShapeWidget();
        break;
      case ShapeNames.rectangle:
        widgetShape = BaseWidget(key: UniqueKey(), shape: ShapeNames.rectangle);
        break;
      case ShapeNames.ellipse:
        widgetShape = BaseWidget(key: UniqueKey(), shape: ShapeNames.ellipse);
        break;
      case ShapeNames.line:
        widgetShape = BaseWidget(key: UniqueKey(), shape: ShapeNames.line);
        break;
      case ShapeNames.polyline:
        widgetShape = BaseWidget(key: UniqueKey(), shape: ShapeNames.polyline);
        break;
      case ShapeNames.path:
        widgetShape = BaseWidget(key: UniqueKey(), shape: ShapeNames.path);
        break;
      case ShapeNames.polygon:
        widgetShape = BaseWidget(key: UniqueKey(), shape: ShapeNames.polygon);
        break;
      default:
        break;
    }
    state = [...state, widgetShape];
  }
}

final imageObjectProvider =
    StateNotifierProvider.autoDispose<ImageObjectsList, List<Widget>>((ref) {
  return ImageObjectsList();
});

//The selected list provider
class SelectedId {
  List<String> selected = [];

  addSelected(String id) {
    selected.add(id);
  }

  clearSelected() {
    selected.clear();
  }

  bool notEmpty() {
    return selected.isNotEmpty;
  }
}

final selectedProvider = Provider<SelectedId>((ref) {
  return SelectedId();
});

final notEmptySelectedListProvider = Provider<bool>((ref) {
  final selectionProvider = ref.watch(selectedProvider);
  return selectionProvider.selected.isNotEmpty;
});

//Selection tool provider
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

//Pan on off Provider
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
