void main() {
  DateTime now = DateTime.now();

  print(DateTime(
      now.year, now.month - 1, -1)); // <now.yeal>-<now.month-2>-<now.day>
  print(DateTime(now.year, 0, now.day)); // <now.yeal-1>-12-<now.day>
  print(DateTime(now.year, -1, 1)); // <now.yeal-1>-11-1

  print(now.toString());
  print(DateTime.parse('2021-01-01 08:00'));
  // print(DateTime.parse('2021-01-01 8:00')); // Error

  testDateTimeComparison();
}

void testDateTimeComparison() {
  print('\n##### testDateTimeComparison #####');
  DateTime now = DateTime.now();
  DateTime nowPlus1Seconds = now.add(const Duration(seconds: 1));
  DateTime nowPlus1Milliseconds = now.add(const Duration(milliseconds: 1));
  DateTime nowPlus1Microseconds = now.add(const Duration(microseconds: 1));

  print(now.isBefore(nowPlus1Seconds)); // true
  print(now.isAfter(nowPlus1Seconds)); // false
  print(now.isAtSameMomentAs(nowPlus1Seconds)); // false

  print(now.isBefore(nowPlus1Milliseconds)); // true
  print(now.isAfter(nowPlus1Milliseconds)); // false
  print(now.isAtSameMomentAs(nowPlus1Milliseconds)); // false

  print(now.isBefore(nowPlus1Microseconds)); // true
  print(now.isAfter(nowPlus1Microseconds)); // false
  print(now.isAtSameMomentAs(nowPlus1Microseconds)); // false

  print(now.isBefore(now)); // false
  print(now.isAfter(now)); // false
  print(now.isAtSameMomentAs(now)); // true
}
