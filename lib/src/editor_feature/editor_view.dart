import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:so_very_good/src/editor_feature/editor_repository.dart';
import 'package:so_very_good/src/editor_feature/editor_row.dart';

import '../drawable_objects.dart/base_widget.dart';

class EditorView extends ConsumerWidget {
  const EditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool pan = true;
    List<Widget> listProvider = ref.watch(imageObjectProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Editor"),
      ),
      body: Column(
        children: [
          const EditorRow(),
          Expanded(
            child: InteractiveViewer(
              panEnabled: pan,
              scaleEnabled: pan,
              maxScale: 7,
              minScale: .4,
              scaleFactor: 100,
              child: Stack(
                children: [for (final item in listProvider) item],
              ),
            ),
          ),
          // const Expanded(child: CanvasView()),
        ],
      ),
    );
  }
}
