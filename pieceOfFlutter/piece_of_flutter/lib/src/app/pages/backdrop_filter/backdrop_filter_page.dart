import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:piece_of_flutter/src/app/constants/constants.dart';
import 'package:piece_of_flutter/src/app/core/base_screen.dart';

class BackdropFilterPage extends StatelessWidget {
  static const String pageName = "BackdropFilter";
  static const String resourceName = 'backdrop_filter';

  const BackdropFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: pageName,
      documentFilePath: documentFilePath(resouceName: resourceName),
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
  final String initialImageUrl =
      'https://images.unsplash.com/photo-1738251198850-39ba48c75fde?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  String imageUrl = '';

  int viewIndex = 0;
  final int viewCounts = 2;

  final double minFilterX = 0;
  final double maxFilterX = 100;
  double filterX = 20;

  final double minFilterY = 0;
  final double maxFilterY = 100;
  double filterY = 20;

  final double minContentsWidth = 0;
  final double maxContentsWidth = 500;
  double contentsWidth = 200;

  final double minContentsHeight = 0;
  final double maxContentsHeight = 500;
  double contentsHeight = 200;

  late TextEditingController textEditingController;
  late ImageFilter filter;

  @override
  void initState() {
    super.initState();
    imageUrl = initialImageUrl;
    textEditingController = TextEditingController(text: initialImageUrl);
    filter = ImageFilter.erode();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 8,
        children: [
          if (viewIndex == 0)
            Expanded(
              child: _BuildBlurBackgroundView(
                imageUrl: imageUrl,
                filterX: filterX,
                filterY: filterY,
                contentsWidth: contentsWidth,
                contentsHeight: contentsHeight,
              ),
            ),
          if (viewIndex == 1)
            Expanded(
              child: _BuildFrontTextView(
                imageUrl: imageUrl,
                filterX: filterX,
                filterY: filterY,
                contentsWidth: contentsWidth,
                contentsHeight: contentsHeight,
              ),
            ),
          if (viewIndex == 2)
            Expanded(
              child: _BuildDilateBackgroundView(
                imageUrl: imageUrl,
                filterX: filterX,
                filterY: filterY,
                contentsWidth: contentsWidth,
                contentsHeight: contentsHeight,
              ),
            ),
          if (viewIndex == 3)
            Expanded(
              child: _BuildErodeBackgroundView(
                imageUrl: imageUrl,
                filterX: filterX,
                filterY: filterY,
                contentsWidth: contentsWidth,
                contentsHeight: contentsHeight,
              ),
            ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('view'),
                    DropdownButton(
                      items: const <DropdownMenuItem<int>>[
                        DropdownMenuItem(
                          value: 0,
                          child: Text('blur-back'),
                        ),
                        DropdownMenuItem(
                          value: 1,
                          child: Text('blur-front'),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('dilate-back'),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text('erode-back'),
                        ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          viewIndex = value ?? 0;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: <Widget>[
                    const Text('ImageURL'),
                    Expanded(
                      child: TextFormField(
                        controller: textEditingController,
                        onFieldSubmitted: (value) {
                          setState(() {
                            imageUrl = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: [
                    const Text('filterX'),
                    Slider(
                      value: filterX,
                      min: minFilterX,
                      max: maxFilterX,
                      onChanged: (double value) {
                        setState(() {
                          filterX = value;
                        });
                      },
                    ),
                    Text('${filterX.toInt()}'),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: [
                    const Text('filterY'),
                    Slider(
                      value: filterY,
                      min: minFilterY,
                      max: maxFilterY,
                      onChanged: (double value) {
                        setState(() {
                          filterY = value;
                        });
                      },
                    ),
                    Text('${filterY.toInt()}'),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: [
                    const Text('contentsWidth'),
                    Slider(
                      value: contentsWidth,
                      min: minContentsWidth,
                      max: maxContentsWidth,
                      onChanged: (double value) {
                        setState(() {
                          contentsWidth = value;
                        });
                      },
                    ),
                    Text('${contentsWidth.toInt()}'),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: [
                    const Text('contentsHeight'),
                    Slider(
                      value: contentsHeight,
                      min: minContentsHeight,
                      max: maxContentsHeight,
                      onChanged: (double value) {
                        setState(() {
                          contentsHeight = value;
                        });
                      },
                    ),
                    Text('${contentsHeight.toInt()}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildBlurBackgroundView extends StatelessWidget {
  const _BuildBlurBackgroundView({
    required this.imageUrl,
    required this.filterX,
    required this.filterY,
    required this.contentsWidth,
    required this.contentsHeight,
  });

  final String imageUrl;
  final double filterX;
  final double filterY;
  final double contentsWidth;
  final double contentsHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.network(
            imageUrl,
            fit: BoxFit.fitHeight,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: filterX, sigmaY: filterY),
          child: Container(
            alignment: Alignment.center,
            child: Image.network(
              imageUrl,
              width: contentsWidth,
              height: contentsHeight,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class _BuildFrontTextView extends StatelessWidget {
  const _BuildFrontTextView({
    required this.imageUrl,
    required this.filterX,
    required this.filterY,
    required this.contentsWidth,
    required this.contentsHeight,
  });

  final String imageUrl;
  final double filterX;
  final double filterY;
  final double contentsWidth;
  final double contentsHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.network(
          imageUrl,
          fit: BoxFit.fitHeight,
        ),
        Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: filterX, sigmaY: filterY),
              child: Container(
                width: contentsWidth,
                height: contentsHeight,
                alignment: Alignment.center,
                child: const Text(
                  'Front',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _BuildDilateBackgroundView extends StatelessWidget {
  const _BuildDilateBackgroundView({
    required this.imageUrl,
    required this.filterX,
    required this.filterY,
    required this.contentsWidth,
    required this.contentsHeight,
  });

  final String imageUrl;
  final double filterX;
  final double filterY;
  final double contentsWidth;
  final double contentsHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.network(
            imageUrl,
            fit: BoxFit.fitHeight,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.dilate(radiusX: filterX, radiusY: filterY),
          child: Container(
            alignment: Alignment.center,
            child: Image.network(
              imageUrl,
              width: contentsWidth,
              height: contentsHeight,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class _BuildErodeBackgroundView extends StatelessWidget {
  const _BuildErodeBackgroundView({
    required this.imageUrl,
    required this.filterX,
    required this.filterY,
    required this.contentsWidth,
    required this.contentsHeight,
  });

  final String imageUrl;
  final double filterX;
  final double filterY;
  final double contentsWidth;
  final double contentsHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.network(
            imageUrl,
            fit: BoxFit.fitHeight,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.erode(radiusX: filterX, radiusY: filterY),
          child: Container(
            alignment: Alignment.center,
            child: Image.network(
              imageUrl,
              width: contentsWidth,
              height: contentsHeight,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
