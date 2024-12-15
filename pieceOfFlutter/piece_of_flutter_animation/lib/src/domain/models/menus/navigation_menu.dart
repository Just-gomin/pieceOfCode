import 'menu.dart';

class NavigationMenu extends Menu<List<NavigationMenu>?> {
  const NavigationMenu({
    required super.title,
    required super.menuItem,
    required this.path,
    required this.name,
  });

  final String path;
  final String name;
}
