import 'package:flutter/material.dart';
import 'package:piece_of_flutter/src/app/constants/constants.dart';
import 'package:piece_of_flutter/src/app/widgets/widgets.dart';

class ContainerPage extends StatelessWidget {
  static const String pageName = "container";
  static String markdownFilePath = documentFilePath(resouceName: 'container');

  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pageName),
      ),
      body: Center(
        child: MarkdownRenderer(
          markdownFilePath: markdownFilePath,
        ),
      ),
    );
  }
}
