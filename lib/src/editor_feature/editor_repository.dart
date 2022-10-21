import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:so_very_good/src/drawable_objects.dart/base_widget.dart';

class ImageObjectsList extends StateNotifier<List<Widget>> {
  ImageObjectsList() : super(const []);

  addWidget() {
    debugPrint("Widget added ${state.length}");
    state = [...state, const BaseWidget()];
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
