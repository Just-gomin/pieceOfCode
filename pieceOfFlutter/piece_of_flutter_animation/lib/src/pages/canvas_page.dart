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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomPaint(
            painter: _DRRectPainter(),
            child: Container(
              width: 600,
              height: 600,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: const Text("This is canvas example."),
            ),
          ),
          const SizedBox(width: 40),
          SizedBox(
            width: 400,
            child: ListView(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('drawArc'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 1; i < 10; i++) {
      final Paint backgroundPaint = Paint()
        ..style = PaintingStyle.fill
        ..color = MyColors.primary.withOpacity((11 - i) / 10)
        ..isAntiAlias = false;

      // Left와 Top은 좌측 상단이 (0,0)으로 시작.
      Rect backgroundRect = Rect.fromLTWH(
        size.width / 10 * (i - 1),
        size.height / 10 * (i - 1),
        size.width / 10,
        size.height / 10,
      );
      canvas.drawRect(backgroundRect, backgroundPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _DRRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final outerRRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(50, 50, size.width - 100, size.height - 100),
      topLeft: const Radius.circular(10),
      topRight: const Radius.circular(10),
      bottomLeft: const Radius.circular(10),
      bottomRight: const Radius.circular(10),
    );

    final innerRRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(66, 66, size.width - 132, size.height - 132),
      topLeft: const Radius.circular(30),
      topRight: const Radius.circular(30),
      bottomLeft: const Radius.circular(30),
      bottomRight: const Radius.circular(30),
    );

    final paint = Paint()
      ..color = MyColors.primary
      ..style = PaintingStyle.fill;

    canvas.drawDRRect(outerRRect, innerRRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
