import 'package:flutter/material.dart';
import 'package:piece_of_flutter/src/app/widgets/markdown_render.dart';

class MarkDownBottomSheet extends StatelessWidget {
  const MarkDownBottomSheet({
    super.key,
    required this.markdownFilePath,
  });

  final String markdownFilePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ),
        Expanded(
          child: MarkdownRenderer(
            markdownFilePath: markdownFilePath,
          ),
        ),
      ],
    );
  }
}
