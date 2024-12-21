import 'package:flutter/material.dart';
import 'package:piece_of_flutter_animation/src/widgets/my_app_bar.dart';

class TickerPage extends StatelessWidget {
  const TickerPage({super.key});

  static String get title => 'Ticker(티커)';
  static String get path => '/ticker';
  static String get name => '$TickerPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: TickerPage.title),
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

  int colorCode = 0xFF7C7365;

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
      begin: Color(colorCode),
      end: Colors.orange,
    ).animate(curve);

    // 티커 추가
    _controller.addListener(printColorCode);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void printColorCode() {
    if (_colorAnimation.value != null) {
      setState(() {
        colorCode = _colorAnimation.value!.value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.only(bottom: 48),
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                color: _colorAnimation.value,
              ),
              const SizedBox(height: 16),
              Text(
                'ColorCode : ${colorCode.toRadixString(16).padLeft(8, '0')}',
              ),
            ],
          );
        },
      ),
    );
  }
}
