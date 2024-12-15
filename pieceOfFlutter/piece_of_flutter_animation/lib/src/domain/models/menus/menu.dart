class Menu<T> {
  const Menu({
    required this.title,
    required this.menuItem,
  });
  final String title;
  final T menuItem;
}
