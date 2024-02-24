import 'package:flutter/material.dart';
import 'package:piece_of_flutter/src/app/pages/home_page.dart';

class PieceOfFlutter extends StatelessWidget {
  const PieceOfFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
