import 'package:flutter/material.dart';
import 'package:piece_of_flutter/src/app/constants/constants.dart';
import 'package:piece_of_flutter/src/app/core/base_screen.dart';

class ContainerPage extends StatelessWidget {
  static const String pageName = "Container";

  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: pageName,
      documentFilePath: documentFilePath(resouceName: 'container'),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return const Center(
      child: Text(pageName),
    );
  }
}
