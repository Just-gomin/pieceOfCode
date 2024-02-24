import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkdownRenderer extends StatelessWidget {
  const MarkdownRenderer({
    super.key,
    required this.markdownFilePath,
  });

  final String markdownFilePath;

  Future<String> loadAsset() async {
    var result = await rootBundle.loadString(markdownFilePath);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadAsset(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Markdown(
            data: snapshot.data!,
            selectable: true,
            onTapLink: (text, href, title) {
              if (href != null) {
                launchUrl(Uri.parse(href));
              }
            },
          );
        }

        return const Text("No Data");
      },
    );
  }
}
