
import 'package:test/test.dart';

import 'package:dart_library_package/math.dart' show divide;

void main() {
  test1('math divide', () {
    var x = 3;
    var y = 1;
    var result = 3;
    expect(divide(x, y), equals(result));
  });
  // zero
  test2('math divide', () {
    var x = 0;
    var y = 1;
    var result = 0;
    expect(divide(x, y), equals(result));
  });
}

