
import 'package:test/test.dart';

import 'package:dart_library_package/math.dart' show subtract;

void main() {
  test('math subtract', () {
    var x = 3;
    var y = 2;
    var result = 1;
    expect(subtract(x, y), equals(result));
  });
}

