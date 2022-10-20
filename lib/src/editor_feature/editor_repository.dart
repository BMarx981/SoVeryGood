import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:so_very_good/src/drawable_objects.dart/base_widget.dart';

class ImageObjectsRepository {
  List<Widget> _widgets = [];

  getWidgets() => _widgets;
  addWidget() {
    _widgets.add(const BaseWidget());
  }
}

final panOnProvider = StateProvider<bool>((ref) => true);
final imageObjectRepositoryProvider = Provider<ImageObjectsRepository>((ref) {
  return ImageObjectsRepository();
});

final imageObjectListProvider = Provider<List<Widget>>((ref) {
  final list = ref.watch(imageObjectRepositoryProvider);
  return list.getWidgets();
});

final imageObjectListAddProvider = Provider<List<Widget>>((ref) {
  final list = ref.watch(imageObjectRepositoryProvider);
  return list.addWidget();
});
