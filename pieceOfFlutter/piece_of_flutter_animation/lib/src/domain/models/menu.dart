class Menu {
  const Menu({
    required this.title,
    this.path,
    this.subMenu,
  });

  final String title;
  final String? path;
  final List<Menu>? subMenu;
}
