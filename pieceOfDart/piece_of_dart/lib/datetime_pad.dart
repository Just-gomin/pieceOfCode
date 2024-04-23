void main() {
  DateTime now = DateTime.now();

  print(DateTime(now.year, now.month - 1, -1)); // <now.yeal>-<now.month-2>-<now.day>
  print(DateTime(now.year, 0, now.day)); // <now.yeal-1>-12-<now.day>
  print(DateTime(now.year, -1, 1)); // <now.yeal-1>-11-1
  
  print(now.toString());
  print(DateTime.parse('2021-01-01 08:00'));
  // print(DateTime.parse('2021-01-01 8:00')); // Error
}
