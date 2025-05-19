void main() {
  Set<String> stringSet = <String>{'a', 'b', 'c', 'd', 'e'};
  print(stringSet);

  int indexOfA = stringSet.toList().indexWhere((i) => i == 'a');
  int indexOfB = stringSet.toList().indexWhere((i) => i == 'b');

  print('$indexOfA, $indexOfB');
}
