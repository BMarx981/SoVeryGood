import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:so_very_good/src/canvas/canvas_view.dart';
import 'package:so_very_good/src/editor_feature/editor_repository.dart';
import 'package:so_very_good/src/editor_feature/editor_row.dart';

class EditorView extends ConsumerWidget {
  const EditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool panOn = ref.watch(panOnProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editor"),
      ),
      body: Column(
        children: [
          const EditorRow(),
          Expanded(
            child: InteractiveViewer(
              panEnabled: panOn,
              scaleEnabled: panOn,
              maxScale: 7,
              minScale: .4,
              scaleFactor: 100,
              child: const CanvasView(),
              // child: Center(
              //   child: SvgPicture.string(
              //       '''<svg width="100" height="100" viewBox="0 0 200 200">
              //     <circle cx="50" cy="50" r="25" fill="#FF0000"/>
              //      <circle cx="150" cy="150" r="25" fill="#55AAAA"/>
              //     </svg>'''),
              // ),
            ),
          ),
          // const Expanded(child: CanvasView()),
        ],
      ),
    );
  }
}
