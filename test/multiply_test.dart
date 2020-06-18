
import 'package:test/test.dart';

import 'package:dart_library_package/math.dart' show multiply;

void main() {
  test('math multiply', () {
    var x = 1;
    var y = 2;
    var result = 2;
    expect(multiply(x, y), equals(result));
  });
}

