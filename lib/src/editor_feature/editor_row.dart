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
      GestureDetector(
        child: const Icon(Icons.circle_outlined),
        onTap: () {
          debugPrint("Circle pressed");
          ref.read(imageObjectProvider.notifier).addWidget(ShapeNames.circle);
        },
      ),
      IconButton(
        icon: const Icon(Icons.rectangle_outlined),
        onPressed: () {
          debugPrint("Rectangle pressed");
          ref
              .read(imageObjectProvider.notifier)
              .addWidget(ShapeNames.rectangle);
        },
      ),
      IconButton(
        icon: const Icon(Icons.circle_outlined),
        onPressed: () {
          debugPrint("Ellipse pressed");
          ref.read(imageObjectProvider.notifier).addWidget(ShapeNames.ellipse);
        },
      ),
      IconButton(
        //TODO : find a better icon for line.
        icon: const Icon(Icons.line_axis),
        onPressed: () {
          debugPrint("Line pressed");
          ref.read(imageObjectProvider.notifier).addWidget(ShapeNames.line);
        },
      ),
      IconButton(
        icon: const Icon(Icons.polyline),
        onPressed: () {
          debugPrint("Rectangle pressed");
          ref.read(imageObjectProvider.notifier).addWidget(ShapeNames.polyline);
        },
      ),
      IconButton(
        icon: const Icon(Icons.pattern_sharp),
        onPressed: () {
          debugPrint("Rectangle pressed");
          ref.read(imageObjectProvider.notifier).addWidget(ShapeNames.path);
        },
      ),
    ]);
  }
}
