import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  /// Contents of View
  final Widget child;

  const DefaultLayout({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: child,
    );
  }
}
