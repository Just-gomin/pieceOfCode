Future<int> delayedReturnInt1() async {
  return Future.delayed(Duration(milliseconds: 300), () => 1);
}

Future<int> delayedReturnInt2() async {
  return Future.delayed(Duration(milliseconds: 700), () => 2);
}

Future<int> delayedReturnInt3() async {
  return Future.delayed(Duration(milliseconds: 300), () => 3);
}

Future<String> delayedReturnStringA() async {
  return Future.delayed(Duration(milliseconds: 900), () => 'A');
}

Future<String> delayedReturnStringB() async {
  return Future.delayed(Duration(milliseconds: 300), () => 'B');
}

void main() {
  delayTest1();
  delayTest2();
}

Future<void> delayTest1() async {
  final Stopwatch stopwatch = Stopwatch();
  final List<Future<dynamic>> futures = [];
  final Future<int> future1 = delayedReturnInt1();
  final Future<int> future2 = delayedReturnInt2();
  final Future<int> future3 = delayedReturnInt3();
  final Future<String> future4 = delayedReturnStringA();
  final Future<String> future5 = delayedReturnStringB();

  stopwatch.start();

  futures.add(future1);
  futures.add(future2);
  futures.add(future3);
  futures.add(future4);
  futures.add(future5);
  await Future.wait(futures);

  final int result1 = await future1;
  final int result2 = await future2;
  final int result3 = await future3;
  final String result4 = await future4;
  final String result5 = await future5;

  print(result1);
  print(result2);
  print(result3);
  print(result4);
  print(result5);

  stopwatch.stop();
  print('delayTest1 ${stopwatch.elapsedMilliseconds}');
}

Future<void> delayTest2() async {
  final Stopwatch stopwatch = Stopwatch();
  final List<Future<dynamic>> futures = [];
  final Future<int> future1 = delayedReturnInt1();
  final Future<int> future2 = delayedReturnInt2();
  final Future<int> future3 = delayedReturnInt3();
  final Future<String> future4 = delayedReturnStringA();
  final Future<String> future5 = delayedReturnStringB();

  stopwatch.start();

  futures.add(future1);
  futures.add(future2);
  futures.add(future3);
  futures.add(future4);
  futures.add(future5);
  final List<dynamic> results = await Future.wait(futures);

  final int result1 = results[0];
  final int result2 = results[1];
  final int result3 = results[2];
  final String result4 = results[3];
  final String result5 = results[4];

  print(result1);
  print(result2);
  print(result3);
  print(result4);
  print(result5);

  stopwatch.stop();
  print('delayTest2 ${stopwatch.elapsedMilliseconds}');
}
