Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield await Future.delayed(Duration(milliseconds: 500)).then((value) => i);
  }
}

void main() {
  Stream<int> stream = countStream(10);
  var sum = 0;
  stream.listen((int value) {
    sum += value;
    print(sum);
  }, onDone: () {
    print('Sum: $sum');
  });
}
