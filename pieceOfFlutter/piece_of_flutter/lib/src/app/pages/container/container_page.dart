import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  static const String pageName = "Container";

  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Container"),
      ),
      body: ListView(),
    );
  }
}
