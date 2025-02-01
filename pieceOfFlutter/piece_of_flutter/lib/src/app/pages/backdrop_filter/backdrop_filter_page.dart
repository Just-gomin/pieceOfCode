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
  int viewIndex = 0;

  final List<Widget> views = <Widget>[
    const _BuildBlurBackgroundView(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 8,
        children: [
          Expanded(child: views[viewIndex]),
          ToggleButtons(
            selectedColor: Colors.white,
            fillColor: const Color(0xFF7C7365),
            isSelected: <bool>[
              for (int i = 0; i < views.length; i++) i == viewIndex,
            ],
            children: <Widget>[
              for (int i = 0; i < views.length; i++) Text("${i + 1}"),
            ],
            onPressed: (index) {
              setState(() {
                viewIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _BuildBlurBackgroundView extends StatelessWidget {
  const _BuildBlurBackgroundView();

  // final String imageUrl =
  //     'https://images.unsplash.com/photo-1735627062325-c978986b1871?q=80&w=3212&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  final String imageUrl =
      'https://images.unsplash.com/photo-1738251198850-39ba48c75fde?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

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
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            alignment: Alignment.center,
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ],
    );
  }
}
