import 'package:flutter/material.dart';
import 'package:piece_of_flutter_animation/src/app/app_router.dart';

class PieceOfFlutterAnimationApp extends StatelessWidget {
  const PieceOfFlutterAnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Piece of Flutter Animation',
      routerConfig: appRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7C7365),
        ),
        useMaterial3: true,
      ),
    );
  }
}
