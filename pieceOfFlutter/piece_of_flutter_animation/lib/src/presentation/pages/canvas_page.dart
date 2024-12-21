import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:piece_of_flutter_animation/src/constants/constants.dart';
import 'package:piece_of_flutter_animation/src/widgets/my_app_bar.dart';

import '../../domain/models/menus/menus.dart';

const double _defaultPadding = 16;
const double _canvasWidth = _defaultPadding * 40;
const double _canvasHeight = _defaultPadding * 40;
const double _maxObjectWidth = _canvasWidth - 2 * _defaultPadding;
const double _maxObjectHeight = _canvasHeight - 2 * _defaultPadding;

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
          Menu<CustomPainter>(
            title: '$ArcPainter',
            menuItem: ArcPainter(),
          ),
          Menu<CustomPainter>(
            title: '$CirclePainter',
            menuItem: CirclePainter(),
          ),
          Menu<CustomPainter>(
            title: '$ColorPainter',
            menuItem: ColorPainter(),
          ),
          Menu<CustomPainter>(
            title: '$ColorFillPainter',
            menuItem: ColorFillPainter(),
          ),
          Menu<CustomPainter>(
            title: '$DRRectPainter',
            menuItem: DRRectPainter(),
          ),
          Menu<CustomPainter>(
            title: '$ImagePainter',
            menuItem: ImagePainter(image: data.data!),
          ),
          Menu<CustomPainter>(
            title: '$LinePainter',
            menuItem: LinePainter(),
          ),
          Menu<CustomPainter>(
            title: '$OvalPainter',
            menuItem: OvalPainter(),
          ),
          Menu<CustomPainter>(
            title: '$PathPainter',
            menuItem: PathPainter(),
          ),
          Menu<CustomPainter>(
            title: '$PointsPainter',
            menuItem: PointsPainter(),
          ),
          Menu<CustomPainter>(
            title: '$RectanglePainter',
            menuItem: RectanglePainter(),
          ),
          Menu<CustomPainter>(
            title: '$RoundRectPainter',
            menuItem: RoundRectPainter(),
          ),
          Menu<CustomPainter>(
            title: '$ShadowPainter',
            menuItem: ShadowPainter(),
          ),
          Menu<CustomPainter>(
            title: '$VerticesPainter',
            menuItem: VerticesPainter(),
          ),
        ];

        return Container(
          padding: const EdgeInsets.all(_defaultPadding),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: CustomPaint(
                          painter: painter,
                          size: const ui.Size(_canvasHeight, _canvasHeight),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(_defaultPadding / 2),
                        child: Text('This is [$title] example'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: _defaultPadding * 2),
                SizedBox(
                  width: _canvasWidth / 3,
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
    const Rect rect = Rect.fromLTWH(
      _defaultPadding,
      _defaultPadding,
      _maxObjectWidth,
      _maxObjectHeight,
    );

    final paint = Paint()
      ..color = MyColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawArc(rect, -math.pi / 2, -math.pi / 2, false, paint);
    canvas.drawArc(
      rect,
      -math.pi,
      -math.pi / 2,
      false,
      paint..color = Colors.blueAccent,
    );
    canvas.drawArc(
      rect,
      -math.pi * 1.5,
      -math.pi / 2,
      false,
      paint..color = Colors.redAccent,
    );
    canvas.drawArc(
      rect,
      0,
      -math.pi / 2,
      false,
      paint..color = Colors.greenAccent,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MyColors.primary
      ..style = PaintingStyle.fill;

    const double radius = _maxObjectWidth / 2;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      radius,
      paint,
    );
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
    // Clip을 해주지 않으면 전체 화면에 색상이 칠해진다.
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawColor(MyColors.primary, BlendMode.src);
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
      ..color = MyColors.primary
      ..strokeWidth = 4;

    canvas.drawLine(
      const Offset(_defaultPadding, _defaultPadding),
      Offset(size.width - _defaultPadding, size.height - _defaultPadding),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class OvalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MyColors.primary
      ..style = PaintingStyle.fill;

    const rect = Rect.fromLTWH(
      _defaultPadding,
      _defaultPadding + _maxObjectHeight * 0.25 / 2,
      _canvasWidth - _defaultPadding * 2,
      _maxObjectHeight * 0.75,
    );
    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MyColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final path = Path()
      ..moveTo(
        _defaultPadding,
        _defaultPadding,
      )
      ..lineTo(
        _maxObjectWidth + _defaultPadding,
        _defaultPadding,
      );

    double dx = _maxObjectWidth + _defaultPadding;
    double dy = _maxObjectWidth + _defaultPadding;

    while (dx > _defaultPadding || dy > _defaultPadding) {
      path.lineTo(dx, dy);
      if (dx >= dy) {
        dx -= _defaultPadding;
      } else {
        dy -= _defaultPadding;
      }
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PointsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    for (StrokeCap strokeCap in ui.StrokeCap.values) {
      final Paint paint = Paint()
        ..color = MyColors.primary
        ..strokeWidth = _defaultPadding
        ..strokeCap = strokeCap;

      final List<Offset> points = <Offset>[];

      for (int i = 0; i < 10; i++) {
        points.add(Offset(
          _defaultPadding + math.Random().nextDouble() * _maxObjectWidth,
          _defaultPadding + math.Random().nextDouble() * _maxObjectHeight,
        ));
      }
      canvas.drawPoints(ui.PointMode.points, points, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MyColors.primary
      ..style = PaintingStyle.fill;

    const rect = Rect.fromLTWH(
      _defaultPadding,
      _defaultPadding,
      _maxObjectWidth,
      _maxObjectHeight,
    );
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RoundRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MyColors.primary
      ..style = PaintingStyle.fill;

    final rrect = RRect.fromLTRBR(
      _defaultPadding,
      _defaultPadding,
      _maxObjectWidth,
      _maxObjectHeight,
      const Radius.circular(20),
    );
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..addOval(
        Rect.fromCircle(
          center: const Offset(
            _defaultPadding + _maxObjectWidth / 2,
            _defaultPadding + _maxObjectHeight / 2,
          ),
          radius: _maxObjectWidth / 2,
        ),
      );

    canvas.drawShadow(path, Colors.black, _defaultPadding, true);
    canvas.drawPath(path, Paint()..color = MyColors.primary);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class VerticesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    ui.Vertices vertices = ui.Vertices(
      VertexMode.triangles,
      [
        const Offset(
          _defaultPadding,
          _defaultPadding,
        ),
        const Offset(
          _defaultPadding + _maxObjectWidth,
          _defaultPadding,
        ),
        const Offset(
          (_defaultPadding + _maxObjectWidth) / 2,
          _defaultPadding + _maxObjectHeight,
        ),
      ],
      colors: [
        Colors.redAccent,
        Colors.greenAccent,
        Colors.blueAccent,
      ],
    );
    canvas.drawVertices(vertices, BlendMode.src, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
