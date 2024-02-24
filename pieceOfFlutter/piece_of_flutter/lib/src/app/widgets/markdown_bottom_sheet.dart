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
        Expanded(
          child: MarkdownRenderer(
            markdownFilePath: markdownFilePath,
          ),
        ),
      ],
    );
  }
}
