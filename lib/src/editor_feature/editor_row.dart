import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:so_very_good/src/editor_feature/editor_repository.dart';

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
          ref.read(imageObjectProvider.notifier).addWidget();
        },
      ),
      IconButton(
        icon: const Icon(Icons.rectangle_outlined),
        onPressed: () {
          debugPrint("Rectangle pressed");
        },
      ),
    ]);
  }
}
