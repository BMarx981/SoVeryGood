import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaveView extends ConsumerWidget {
  const SaveView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Save'),
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: const Text(""),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: const Text(""),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: const Text(""),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: const Text(""),
                ),
              ),
            ),
          ],
        ));
  }
}
