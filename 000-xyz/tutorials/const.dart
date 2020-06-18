void main() {
  // int / double
  final num age = 18;
  // String
  const String name = 'xgqfrms';
  print(age);
  print(name);
}

void test() {
  final age = 18;
  const name = 'xgqfrms';
  print(age);
  print(name);
}


void test1() {
  final age;
  // The final variable 'age' must be initialized. (dartfinal_not_initialized)
  age = 18;
  // The final variable 'age' can only be set once. (assignment_to_final_local)
  const name = 'xgqfrms';
  print(age);
  print(name);
}

void test2() {
  final age = 18;
  const name;
  // The constant 'name' must be initialized. (const_not_initialized)
  name = 'xgqfrms';
  // Constant variables can't be assigned a value. (assignment_to_const)
  print(age);
  print(name);
}
