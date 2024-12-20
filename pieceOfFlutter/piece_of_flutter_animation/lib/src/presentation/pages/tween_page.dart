import 'package:flutter/material.dart';
import 'package:piece_of_flutter_animation/src/presentation/widgets/my_app_bar.dart';

class TweenPage extends StatelessWidget {
  const TweenPage({super.key});

  static String get title => 'Tween(트윈)';
  static String get path => '/tween';
  static String get name => '$TweenPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: TweenPage.title),
      body: const _BuildBody(),
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
      begin: const Color(0xFF7C7365),
      end: Colors.orange,
    ).animate(_controller);

    // _controller.repeat(); // 반복할 때, end에서 바로 begin으로 초기화 하여 반복
    _controller.repeat(reverse: true); // 반복할 때, end에서 begin으로 돌아가며 반복
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
