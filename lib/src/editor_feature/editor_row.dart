import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:so_very_good/src/editor_feature/editor_repository.dart';

import '../drawable_objects.dart/base_widget.dart';

class EditorRow extends ConsumerWidget {
  const EditorRow({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pan = ref.watch(panOnStateProvider);
    return Row(children: [
      Semantics(
        button: true,
        value: "Zoom button",
        child: GestureDetector(
          onTap: () {
            ref.read(panOnStateProvider.notifier).togglePan();
          },
          child: Icon(
            Icons.search,
            color: pan ? Colors.black : Colors.grey,
          ),
        ),
      ),
      Semantics(
        button: true,
        value: "Circle button",
        child: GestureDetector(
          child: const Icon(Icons.circle_outlined),
          onTap: () {
            ref.read(imageObjectProvider.notifier).addWidget(ShapeNames.circle);
          },
        ),
      ),
      Semantics(
        button: true,
        value: "Rectangle button",
        child: IconButton(
          icon: const Icon(Icons.rectangle_outlined),
          onPressed: () {
            ref
                .read(imageObjectProvider.notifier)
                .addWidget(ShapeNames.rectangle);
          },
        ),
      ),
      Semantics(
        button: true,
        value: "Ellipse button",
        child: IconButton(
          icon: const Icon(Icons.circle_outlined),
          onPressed: () {
            ref
                .read(imageObjectProvider.notifier)
                .addWidget(ShapeNames.ellipse);
          },
        ),
      ),
      Semantics(
        button: true,
        value: "Line button",
        child: IconButton(
          //TODO : find a better icon for line.
          icon: const Icon(Icons.line_axis),
          onPressed: () {
            ref.read(imageObjectProvider.notifier).addWidget(ShapeNames.line);
          },
        ),
      ),
      Semantics(
        button: true,
        value: "Polyline button",
        child: IconButton(
          icon: const Icon(Icons.polyline),
          onPressed: () {
            ref
                .read(imageObjectProvider.notifier)
                .addWidget(ShapeNames.polyline);
          },
        ),
      ),
      Semantics(
        button: true,
        value: "path button",
        child: IconButton(
          icon: const Icon(Icons.pattern_sharp),
          onPressed: () {
            debugPrint("Rectangle pressed");
            ref.read(imageObjectProvider.notifier).addWidget(ShapeNames.path);
          },
        ),
      ),
      Semantics(
        button: true,
        value: "Polygon button",
        child: IconButton(
          icon: const Icon(Icons.rectangle_outlined),
          onPressed: () {
            ref
                .read(imageObjectProvider.notifier)
                .addWidget(ShapeNames.polygon);
          },
        ),
      ),
      Semantics(
        button: true,
        value: "Delete button",
        child: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            // ref.read(imageObjectProvider.notifier).deleteItem();
          },
        ),
      ),
    ]);
  }
}
