# Dart 内置库

包名 描述

dart:async 异步编程，提供Future,Stream类
dart:collection 集合
dart:convert 不同类型的字符编码解码
dart:core Dart语言核心功能，内置类型
dart:html 网页开发用到的库
dart:io 文件读写，IO相关
dart:math 数字常量及函数，随机算法等
dart:svg 事件和动画矢量图支持

http://www.cainiaoxueyuan.com/ymba/17952.html

## Dart 数据类型

类型	说明
num	数字，包含int（整数）和double（浮点数）
String	字符串
bool	布尔，逻辑true或false
List	数组/list集合
Set	set集合
Map	map集合
Runes	符号，Unicode字符
Symbole	标示

https://www.jianshu.com/p/05daef045e8d


## var / date type

```dart


var name = 'xgqfrms';

String name = 'xgqfrms';

// var String name = 'xgqfrms';
// Variables can't be declared using both 'var' and a type name. (var_and_type)


```

## final / const

区别: final 初始化必须先赋值，不然会报错; const 声明初始化时必须赋值，不然会报错;


final 跟 Java 里的 final 一样，表示一个运行时常量（在程序运行的时候赋值，赋值后值不再改变）。const 表示一个编译时常量，在程序编译的时候它的值就确定了。


```dart
void main() {
  // int / double
  final num age = 18;
}

void main() {
  final age = 18;
}


const String name = 'xgqfrms';

const name = 'xgqfrms';

```


https://juejin.im/tag/Dart

https://juejin.im/tag/Flutter


## Dart static, final, const 区别 ？

https://juejin.im/post/5d396a03f265da1b68370110


https://juejin.im/post/5bcc8527f265da0aff17729a

https://jarontai.github.io/dart-souls/language/basics.html
