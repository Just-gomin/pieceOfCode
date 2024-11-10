import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:piece_of_flutter_animation/src/data/menu_tree.dart';
import 'package:piece_of_flutter_animation/src/domain/models/models.dart';
import 'package:piece_of_flutter_animation/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String get path => '/';
  static String get name => '$HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Home'),
      body: _BuildBody(),
    );
  }
}

class _BuildBody extends StatelessWidget {
  _BuildBody();

  final List<Menu> menuList = [
    animationBase,
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        for (Menu menu in menuList)
          _BuildSectionWithItems(
            menu: menu,
          ),
      ],
    );
  }
}

class _BuildSectionWithItems extends StatelessWidget {
  const _BuildSectionWithItems({
    required this.menu,
  });

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(
      [
        _BuildSectionTitle(title: menu.title),
        ...(menu.subMenu ?? []).map((item) => _BuildListItem(menu: item))
      ],
    ));
  }
}

class _BuildSectionTitle extends StatelessWidget {
  const _BuildSectionTitle({
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _BuildListItem extends StatelessWidget {
  const _BuildListItem({required this.menu});

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(menu.title),
      onTap: () {
        context.go(menu.path!);
      },
    );
  }
}
