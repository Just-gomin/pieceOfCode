import 'package:flutter/material.dart';

class PieceOfFlutter extends StatelessWidget {
  const PieceOfFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text("Hi"),
        ),
      ),
    );
  }
}
