void main() {
  Set<String> stringSet = <String>{};

  stringSet.add('a');
  print(stringSet);
  stringSet.add('d');
  stringSet.add('b');
  print(stringSet);
  stringSet.add('c');
  stringSet.add('e');
  print(stringSet);
  stringSet.add('c');
  print(stringSet); // Set 은 입력 순서가 유지 된다.

  int indexOfA = stringSet.toList().indexWhere((i) => i == 'a');
  int indexOfB = stringSet.toList().indexWhere((i) => i == 'b');
  print('$indexOfA, $indexOfB');
}
