import 'package:flutter/material.dart';
import 'package:piece_of_flutter_animation/src/widgets/my_app_bar.dart';

class TweenPage extends StatelessWidget {
  const TweenPage({super.key});

  static String get path => '/tween';
  static String get name => '$TweenPage';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: 'Tween(트윈)'),
      body: _BuildBody(),
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
