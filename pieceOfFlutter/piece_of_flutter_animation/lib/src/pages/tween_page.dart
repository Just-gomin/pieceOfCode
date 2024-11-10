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

class __BuildBodyState extends State<_BuildBody> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _colorAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.yellow,
    ).animate(_controller);

    // _controller.repeat(); // 반복할 때, end에서 바로 begin으로 초기화 하여 반복
    _controller.repeat(reverse: true); // 반복할 때, end에서 begin으로 돌아가며 반복
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return Container(
            width: 200,
            height: 200,
            color: _colorAnimation.value,
          );
        },
      ),
    );
  }
}
