import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:piece_of_flutter_animation/src/domain/models/models.dart';
import 'package:piece_of_flutter_animation/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.menuList,
  });

  static String get title => 'HOME';
  static String get path => '/';
  static String get name => '$HomePage';

  final List<Menu> menuList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: HomePage.title),
      body: _BuildBody(menuList: menuList),
    );
  }
}

class _BuildBody extends StatelessWidget {
  const _BuildBody({
    required this.menuList,
  });

  final List<Menu> menuList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: <Widget>[
          for (Menu menu in menuList) ...[
            _BuildSectionWithItems(
              menu: menu,
            ),
          ],
        ],
      ),
    );
  }
}

class _BuildSectionWithItems extends StatelessWidget {
  _BuildSectionWithItems({
    required this.menu,
  });

  final Menu menu;
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(
      [
        _BuildSectionTitle(title: menu.title),
        ...(menu.subMenu ?? []).map(
          (item) => _BuildListItem(menu: item),
        )
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
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 4,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class _BuildListItem extends StatefulWidget {
  const _BuildListItem({required this.menu});

  final Menu menu;

  @override
  State<_BuildListItem> createState() => _BuildListItemState();
}

class _BuildListItemState extends State<_BuildListItem> {
  bool isHover = false;

  void setHoverState(bool val) {
    setState(() {
      isHover = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setHoverState(true);
      },
      onExit: (event) {
        setHoverState(false);
      },
      onEnter: (event) {
        setHoverState(true);
      },
      child: ListTile(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        title: Text(
          widget.menu.title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isHover ? Colors.white : Colors.black,
          ),
        ),
        onTap: () {
          context.goNamed(widget.menu.name);
        },
        hoverColor: Theme.of(context).primaryColor,
        splashColor: Theme.of(context).primaryColor.withAlpha(128),
      ),
    );
  }
}
