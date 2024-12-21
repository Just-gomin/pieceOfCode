import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:piece_of_flutter_animation/src/presentation/themes/themes.dart';
import 'package:piece_of_flutter_animation/src/presentation/widgets/my_app_bar.dart';

const double _defaultPadding = 16;
const double _canvasWidth = _defaultPadding * 40;
const double _canvasHeight = _defaultPadding * 40;
const double _maxObjectWidth = _canvasWidth - 2 * _defaultPadding;
const double _maxObjectHeight = _canvasHeight - 2 * _defaultPadding;

class CanvasWithAnimationPage extends StatelessWidget {
  const CanvasWithAnimationPage({super.key});

  static String get title => 'Canvas with Animation(캔버스와 애니메이션)';
  static String get path => '/canvas-with-animation';
  static String get name => '$CanvasWithAnimationPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title),
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
  late Animation<double> _linearAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    final CurvedAnimation curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );

    _linearAnimation = Tween<double>(begin: 1, end: 5).animate(curve);
    _controller.repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: _linearAnimation,
          builder: (BuildContext context, Widget? child) {
            return DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: CustomPaint(
                painter: WavePainter(animationValue: _linearAnimation.value),
                size: const ui.Size(_canvasHeight, _canvasHeight),
              ),
            );
          }),
    );
  }
}

class WavePainter extends CustomPainter {
  final double animationValue;

  WavePainter({
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final Paint circlePaint = Paint()
      ..color = MyColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    const double radius = 16;

    final path = Path()..moveTo(_defaultPadding, _defaultPadding);

    for (double i = _defaultPadding;
        i < _defaultPadding + _maxObjectWidth;
        i++) {
      double dy = _defaultPadding + _canvasHeight / 2;
      dy += math.sin((i / _maxObjectWidth + animationValue) * 2 * math.pi) * 25;

      path.lineTo(i, dy);
      if (i >= (_maxObjectWidth + 2 * _defaultPadding) / 2 &&
          i <= (_maxObjectWidth + 2 * _defaultPadding) / 2 + 1) {
        canvas.drawCircle(Offset(i, dy - radius + 2), radius, circlePaint);
      }
    }

    path
      ..lineTo(
        _maxObjectWidth + _defaultPadding,
        _maxObjectHeight + _defaultPadding,
      )
      ..lineTo(
        _defaultPadding,
        _maxObjectHeight + _defaultPadding,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
