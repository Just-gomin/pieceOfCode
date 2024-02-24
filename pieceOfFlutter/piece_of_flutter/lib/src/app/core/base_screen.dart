import 'package:flutter/material.dart';
import 'package:piece_of_flutter/src/app/widgets/widgets.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.title,
    required this.documentFilePath,
    required this.body,
  });

  final String title;
  final String documentFilePath;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).showBottomSheet(
                  (BuildContext context) {
                    return MarkDownBottomSheet(
                      markdownFilePath: documentFilePath,
                    );
                  },
                );
              },
              icon: const Icon(Icons.info_outline_rounded),
            );
          }),
        ],
      ),
      body: body,
    );
  }
}
