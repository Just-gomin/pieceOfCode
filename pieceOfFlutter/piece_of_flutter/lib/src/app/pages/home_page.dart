import 'package:flutter/material.dart';
import 'package:piece_of_flutter/src/app/pages/pages.dart';
import 'package:piece_of_flutter/src/domain/page_source.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PageSource> pageSources = [
      PageSource(
        pageName: BackdropFilterPage.pageName,
        page: const BackdropFilterPage(),
      ),
      PageSource(
        pageName: ContainerPage.pageName,
        page: const ContainerPage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("PieceOfFlutter"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final source = pageSources[index];

          return ListTile(
            title: Text(source.pageName),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => source.page),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 2,
          );
        },
        itemCount: pageSources.length,
      ),
    );
  }
}
