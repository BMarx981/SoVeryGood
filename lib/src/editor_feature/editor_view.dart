import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:so_very_good/src/editor_feature/editor_repository.dart';
import 'package:so_very_good/src/editor_feature/editor_row.dart';

import '../drawable_objects.dart/base_widget.dart';

class EditorView extends ConsumerWidget {
  const EditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool pan = ref.watch(panOnStateProvider);
    List<Widget> listProvider = ref.watch(imageObjectProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Editor"), actions: [
        Semantics(
          button: true,
          value: "Save button",
          child: IconButton(
            icon: const Icon(Icons.save_outlined),
            onPressed: () {
              GoRouter.of(context).go('/save');
            },
          ),
        ),
      ]),
      body: SafeArea(
        child: Column(
          children: [
            const EditorRow(),
            Expanded(
              child: InteractiveViewer(
                panEnabled: pan,
                scaleEnabled: pan,
                maxScale: 7,
                minScale: .4,
                scaleFactor: 100,
                child: Stack(children: [
                  Positioned(
                    top: 0,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: listProvider,
                    ),
                  )
                ]),
              ),
            ),
            // const Expanded(child: CanvasView()),
          ],
        ),
      ),
    );
  }
}
