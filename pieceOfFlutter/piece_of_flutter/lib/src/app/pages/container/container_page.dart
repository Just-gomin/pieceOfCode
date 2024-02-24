import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class ContainerPage extends StatelessWidget {
  static const String pageName = "Container";

  const ContainerPage({super.key});

  Future<String> loadAsset() async {
    var result =
        await rootBundle.loadString('lib/src/app/pages/container/README.md');
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Container"),
      ),
      body: Center(
        child: FutureBuilder(
          future: loadAsset(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Markdown(
                data: snapshot.data!,
                selectable: true,
                onTapLink: (text, href, title) {
                  // print(text);
                  if (href != null) {
                    launchUrl(Uri.parse(href));
                  }
                  // print(title);
                },
              );
            }

            return const Text("No Data");
          },
        ),
      ),
    );
  }
}
