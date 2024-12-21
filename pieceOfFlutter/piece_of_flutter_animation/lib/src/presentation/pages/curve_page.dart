import 'package:flutter/material.dart';
import 'package:piece_of_flutter_animation/src/presentation/widgets/my_app_bar.dart';

class CurvePage extends StatelessWidget {
  const CurvePage({super.key});

  static String get title => 'Curve(곡선)';
  static String get path => '/curve';
  static String get name => '$CurvePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: CurvePage.title),
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

    final CurvedAnimation curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.slowMiddle,
    );

    _colorAnimation = ColorTween(
      begin: const Color(0xFF7C7365),
      end: Colors.orange,
    ).animate(curve);

    _controller.repeat(reverse: true);
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
