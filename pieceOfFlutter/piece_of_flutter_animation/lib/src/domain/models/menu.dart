class Menu {
  const Menu({
    required this.title,
    required this.path,
    required this.name,
    this.subMenu,
  });

  final String title;
  final String path;
  final String name;
  final List<Menu>? subMenu;
}
