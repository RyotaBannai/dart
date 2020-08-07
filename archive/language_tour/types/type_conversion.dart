void main() {
  String piAsString = 3.14159.toStringAsFixed(2);
  print(piAsString);
  assert(piAsString !=
      '3.14'); // use with option 'dart --enable-asserts types/type_conversion.dart'
}
