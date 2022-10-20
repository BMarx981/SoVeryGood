import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:so_very_good/src/editor_feature/editor_repository.dart';

class EditorRow extends ConsumerWidget {
  const EditorRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool panOn = ref.watch(panOnProvider);
    return Row(children: [
      Semantics(
        button: true,
        value: "Zoom button",
        child: GestureDetector(
          onTap: () {
            ref.read(panOnProvider.state).state =
                !ref.read(panOnProvider.state).state;
          },
          child: Icon(
            Icons.search,
            color: panOn ? Colors.black : Colors.grey,
          ),
        ),
      ),
      GestureDetector(
        child: const Icon(Icons.circle_outlined),
        onTap: () {
          debugPrint("Circle pressed");
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
