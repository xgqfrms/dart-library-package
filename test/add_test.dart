
import 'package:test/test.dart';

import 'package:dart-library-package/math.dart' show add;

void main() {
  test('math add', () {
    var x = 1;
    var y = 2;
    var sum = 3;
    expect(add(x, y), equals(sum));
  });
}

