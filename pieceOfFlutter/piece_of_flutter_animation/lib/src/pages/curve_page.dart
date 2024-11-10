import 'package:flutter/material.dart';
import 'package:piece_of_flutter_animation/src/widgets/my_app_bar.dart';

class CurvePage extends StatelessWidget {
  const CurvePage({super.key});

  static String get title => 'Curve(곡선)';
  static String get path => '/curve';
  static String get name => '$CurvePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: CurvePage.title),
    );
  }
}

class _BuildBody extends StatefulWidget {
  const _BuildBody();

  @override
  State<_BuildBody> createState() => __BuildBodyState();
}

class __BuildBodyState extends State<_BuildBody> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
