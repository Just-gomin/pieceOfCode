import 'dart:convert';

void main() {
  addPropWithCallByReference();
}

void addPropWithCallByReference() {
  Map<String, dynamic> json = {};

  _addPropWithCallByReference(json, 'key', null);
  print(jsonEncode(json));

  _addPropWithCallByReference(json, 'key', 1);
  print(jsonEncode(json));
}

void _addPropWithCallByReference(Map<String, dynamic> json, String key, dynamic val) {
  if (val != null) json[key] = val;
}
