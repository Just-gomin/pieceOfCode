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

  final double minSigmaX = 0;
  final double maxSigmaX = 100;
  double sigmaX = 20;

  final double minSigmaY = 0;
  final double maxSigmaY = 100;
  double sigmaY = 20;

  final double minContentsWidth = 0;
  final double maxContentsWidth = 500;
  double contentsWidth = 200;

  final double minContentsHeight = 0;
  final double maxContentsHeight = 500;
  double contentsHeight = 200;

  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    imageUrl = initialImageUrl;
    textEditingController = TextEditingController(text: initialImageUrl);
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
                sigmaX: sigmaX,
                sigmaY: sigmaY,
                contentsWidth: contentsWidth,
                contentsHeight: contentsHeight,
              ),
            ),
          if (viewIndex == 1)
            Expanded(
              child: _BuildFrontTextView(
                imageUrl: imageUrl,
                sigmaX: sigmaX,
                sigmaY: sigmaY,
                contentsWidth: contentsWidth,
                contentsHeight: contentsHeight,
              ),
            ),
          ToggleButtons(
            isSelected: <bool>[
              for (int i = 0; i < viewCounts; i++) i == viewIndex,
            ],
            children: <Widget>[
              for (int i = 0; i < viewCounts; i++) Text("${i + 1}"),
            ],
            onPressed: (index) {
              setState(() {
                viewIndex = index;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              const Text('sigmaX'),
              Slider(
                value: sigmaX,
                min: minSigmaX,
                max: maxSigmaX,
                onChanged: (double value) {
                  setState(() {
                    sigmaX = value;
                  });
                },
              ),
              Text('${sigmaX.toInt()}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              const Text('sigmaY'),
              Slider(
                value: sigmaY,
                min: minSigmaY,
                max: maxSigmaY,
                onChanged: (double value) {
                  setState(() {
                    sigmaY = value;
                  });
                },
              ),
              Text('${sigmaY.toInt()}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}

class _BuildBlurBackgroundView extends StatelessWidget {
  const _BuildBlurBackgroundView({
    required this.imageUrl,
    required this.sigmaX,
    required this.sigmaY,
    required this.contentsWidth,
    required this.contentsHeight,
  });

  final String imageUrl;
  final double sigmaX;
  final double sigmaY;
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
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
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
    required this.sigmaX,
    required this.sigmaY,
    required this.contentsWidth,
    required this.contentsHeight,
  });

  final String imageUrl;
  final double sigmaX;
  final double sigmaY;
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
              filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
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
