import 'package:flutter/material.dart';
import 'package:piece_of_flutter/src/app/constants/constants.dart';
import 'package:piece_of_flutter/src/app/widgets/widgets.dart';

class ContainerPage extends StatelessWidget {
  static const String pageName = "Container";
  static String markdownFilePath = documentFilePath(resouceName: 'container');

  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: const Text(pageName),
      actions: [
        Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).showBottomSheet(
                (BuildContext context) {
                  return MarkDownBottomSheet(
                    markdownFilePath: markdownFilePath,
                  );
                },
              );
            },
            icon: const Icon(Icons.info_outline_rounded),
          );
        }),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return const Center(
      child: Text("container"),
    );
  }
}
