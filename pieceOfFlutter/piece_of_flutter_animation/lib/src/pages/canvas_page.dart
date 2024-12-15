import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:piece_of_flutter_animation/src/constants/constants.dart';
import 'package:piece_of_flutter_animation/src/widgets/my_app_bar.dart';

import '../domain/models/menus/menus.dart';

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

class _BuildBody extends StatefulWidget {
  const _BuildBody();

  @override
  State<_BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<_BuildBody> {
  Future<ui.Image> loadImage() async {
    final Completer completer = Completer<ui.Image>();
    final ImageStream imageStream = const NetworkImage(
      'https://storage.googleapis.com/cms-storage-bucket/a9d6ce81aee44ae017ee.png',
    ).resolve(const ImageConfiguration());
    imageStream.addListener(ImageStreamListener((info, _) {
      completer.complete(info.image);
    }));
    final ui.Image image = await completer.future;
    return image;
  }

  String title = '$ArcPainter';
  CustomPainter painter = ArcPainter();

  void setMenu({
    required String title,
    required CustomPainter painter,
  }) {
    setState(() {
      this.title = title;
      this.painter = painter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadImage(),
      builder: (BuildContext context, AsyncSnapshot<ui.Image> data) {
        if (!data.hasData) return const SizedBox();
        final List<Menu<CustomPainter>> menuList = <Menu<CustomPainter>>[
          Menu<CustomPainter>(title: '$ArcPainter', menuItem: ArcPainter()),
          Menu<CustomPainter>(
              title: '$CirclePainter', menuItem: CirclePainter()),
          Menu<CustomPainter>(title: '$ColorPainter', menuItem: ColorPainter()),
          Menu<CustomPainter>(
              title: '$ColorFillPainter', menuItem: ColorFillPainter()),
          Menu<CustomPainter>(
              title: '$DRRectPainter', menuItem: DRRectPainter()),
          Menu<CustomPainter>(
              title: '$ImagePainter',
              menuItem: ImagePainter(image: data.data!)),
          Menu<CustomPainter>(title: '$LinePainter', menuItem: LinePainter()),
          Menu<CustomPainter>(title: '$OvalPainter', menuItem: OvalPainter()),
          Menu<CustomPainter>(title: '$PathPainter', menuItem: PathPainter()),
          Menu<CustomPainter>(
              title: '$PointsPainter', menuItem: PointsPainter()),
          Menu<CustomPainter>(
              title: '$RectanglePainter', menuItem: RectanglePainter()),
          Menu<CustomPainter>(
              title: '$RoundRectPainter', menuItem: RoundRectPainter()),
          Menu<CustomPainter>(
              title: '$ShadowPainter', menuItem: ShadowPainter()),
          Menu<CustomPainter>(
              title: '$VerticesPainter', menuItem: VerticesPainter()),
        ];

        return Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomPaint(
                  painter: painter,
                  child: Container(
                    width: 600,
                    height: 600,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('This is "$title" example.'),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                SizedBox(
                  width: 200,
                  child: ListView(
                    children: <Widget>[
                      for (Menu<CustomPainter> menuItem in menuList)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              setMenu(
                                title: menuItem.title,
                                painter: menuItem.menuItem,
                              );
                            },
                            child: Text(menuItem.title),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MyColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    const Rect rect = Rect.fromLTWH(50, 50, 150, 150);
    canvas.drawArc(rect, 0, math.pi / 2, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawCircle(const Offset(100, 100), 50, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ColorPainter extends CustomPainter {
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

class ColorFillPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.yellow, BlendMode.src);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DRRectPainter extends CustomPainter {
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

class ImagePainter extends CustomPainter {
  ImagePainter({
    required this.image,
  });

  final ui.Image image;

  @override
  void paint(Canvas canvas, Size size) async {
    final double dx = (size.width - image.width) / 2;
    final double dy = (size.height - image.height) / 2;
    canvas.drawImage(image, Offset(dx, dy), Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4;

    canvas.drawLine(const Offset(20, 20), const Offset(100, 100), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class OvalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;

    const rect = Rect.fromLTWH(50, 50, 150, 100);
    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path()
      ..moveTo(20, 20)
      ..lineTo(100, 20)
      ..quadraticBezierTo(150, 0, 200, 20)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PointsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final points = [
      const Offset(50, 50),
      const Offset(100, 100),
      const Offset(150, 50),
      const Offset(200, 100),
    ];

    canvas.drawPoints(ui.PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    const rect = Rect.fromLTWH(50, 50, 100, 80);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RoundRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final rrect = RRect.fromLTRBR(50, 50, 150, 150, const Radius.circular(20));
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..addOval(Rect.fromCircle(center: const Offset(100, 100), radius: 50));

    canvas.drawShadow(path, Colors.black, 4, true);
    canvas.drawPath(path, Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class VerticesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final vertices = ui.Vertices(
      VertexMode.triangles,
      [
        const Offset(50, 50),
        const Offset(150, 50),
        const Offset(100, 150),
      ],
      colors: [
        Colors.red,
        Colors.green,
        Colors.blue,
      ],
    );

    canvas.drawVertices(vertices, BlendMode.src, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
