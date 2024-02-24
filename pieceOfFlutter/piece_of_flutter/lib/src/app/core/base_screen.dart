import 'package:flutter/material.dart';
import 'package:piece_of_flutter/src/app/widgets/widgets.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({
    super.key,
    required this.title,
    required this.documentFilePath,
    required this.body,
  });

  final String title;
  final String documentFilePath;
  final Widget body;

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  bool isBottomSheetOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Builder(builder: (context) {
            return !isBottomSheetOpen
                ? IconButton(
                    onPressed: () {
                      Scaffold.of(context).showBottomSheet(
                        (BuildContext context) {
                          return MarkDownBottomSheet(
                            markdownFilePath: widget.documentFilePath,
                          );
                        },
                      );

                      setState(() {
                        isBottomSheetOpen = true;
                      });
                    },
                    icon: const Icon(Icons.info_outline_rounded),
                  )
                : IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        isBottomSheetOpen = false;
                      });
                    },
                    icon: const Icon(Icons.close),
                  );
          }),
        ],
      ),
      body: widget.body,
    );
  }
}
