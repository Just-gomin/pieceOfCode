import 'package:flutter/material.dart';
import 'package:piece_of_flutter_animation/src/constants/constants.dart';
import 'package:piece_of_flutter_animation/src/widgets/my_app_bar.dart';

class CanvasPage extends StatelessWidget {
  const CanvasPage({super.key});

  static String get title => 'Canvas(캔버스)';
  static String get path => '/canvas';
  static String get name => '$CanvasPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title),
      body: const _BuildBody(),
    );
  }
}

class _BuildBody extends StatelessWidget {
  const _BuildBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: CustomPaint(
        painter: _MyPainter(),
        child: Container(),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = MyColors.primary
      ..isAntiAlias = false;
    Rect backgroundRect = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    );

    canvas.drawRect(backgroundRect, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}
