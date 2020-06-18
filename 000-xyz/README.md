# dart-library-package

> The Dart ecosystem uses packages to share software such as libraries and tools.

https://dart.dev/guides/packages

https://dart.dev/tools/pub/glossary#library-package

## packages

> library-package

https://dart.dev/guides/libraries/create-library-packages#organizing-a-library-package


## `pubspec.yaml` file

`pubspec.yaml` file for a library is the same as for an application package—there is no special designation to indicate that the package is a library.

## `lib` directory

<span title="As you might expect, the library code lives under the lib directory and is public to other packages. You can create any hierarchy under lib, as needed;">
如您所料，库代码位于lib目录下，并且对其他软件包是公共的。您可以根据需要在lib下创建任何层次结构。
</span>

按照约定，实现代码位于lib / src下。 lib / src下的代码被认为是私有的；其他软件包永远不需要导入src / ...

要公开lib / src下的API，您可以从lib下的文件中导出lib / src文件。

**注意**：未指定库指令时，会根据每个库的路径和文件名为它们生成一个唯一标记。

因此，我们建议您从代码中省略库指令，除非您打算生成库级文档

https://dart.dev/guides/libraries/create-library-packages#documenting-a-library


在lib / lib / <package-name> .dart下直接创建一个“ main”库文件，该文件将导出所有公共API。这使用户可以通过导入单个文件来获得库的所有功能。

lib目录可能还包括其他可导入的非src库。例如，也许您的主库跨平台工作，但是您创建了依赖dart：io或dart：html的单独的库。
某些软件包具有单独的库，但如果没有主库，则应使用前缀导入。

让我们看一下现实世界中图书馆书架的结构：书架。

货架软件包提供了一种使用Dart创建Web服务器的简便方法，并以Dart库软件包常用的结构进行布局：

直接在lib下，主库文件shelf.dart从lib / src导出几个文件：

书架包还包含一个小型库：shelf_io。该适配器处理dart：io的HttpRequest对象。

**Web应用程序提示**：为了在使用dartdevc开发时获得最佳性能，请将实现文件放在/ lib / src下，而不是在/ lib下的其他地方。 另外，避免导入package：package_name / src / ....

## shelf

https://github.com/dart-lang/shelf


https://dart.dev/tools/dartdevc


https://dart.dev/tools/pub/package-layout#implementation-files


## touch


```sh
$ cd lib/src/

$ touch add.dart subtract.dart multiply.dart divide.dart

$ touch add_io.dart subtract_io.dart multiply_io.dart divide_io.dart

$ touch add_html.dart subtract_html.dart multiply_html.dart divide_html.dart

# test
$ touch add_test.dart subtract_test.dart multiply_test.dart divide_test.dart


```


## 导入库文件

从另一个包中导入库文件时，请使用package：指令指定该文件的URI。

```dart
import 'package:utilities/utilities.dart';

// import 'package:dart-library-package/lib/math.dart';
// no need lib
import 'package:dart-library-package/math.dart';


```

从您自己的包中导入库文件时，如果两个文件都在lib内，或者两个文件都在lib之外，请使用相对路径。 使用包：当导入的文件在lib中并且导入器在外部时。


## 有条件地导入和导出库文件


如果您的库支持多个平台，则可能需要有条件地导入或导出库文件。一个常见的用例是同时支持Web和本机平台的库。

要有条件地导入或导出，您需要检查dart：*库的存在。

这是一个条件导出代码示例，用于检查dart：io和dart：html的存在

```dart
export 'src/hw_none.dart' // Stub implementation
  if (dart.library.io) 'src/hw_io.dart' // dart:io implementation
  if (dart.library.html) 'src/hw_html.dart'; // dart:html implementation

```

该代码的作用如下：

在可以使用dart：io的应用程序（例如，命令行应用程序）中，导出 src/hw_io.dart。
在可以使用dart：html的应用程序（网络应用程序）中，导出 src/hw_html.dart。
否则，导出 src/hw_none.dart。

要有条件地导入文件，请使用与上面相同的代码，但是将export更改为import。

注意：有条件的导入或导出仅检查该库是否可在当前平台上使用，而不检查它是否已实际导入或使用。


所有有条件导出的库都必须实现相同的API。例如，这是dart：io的实现：

```dart
// lib/src/hw_io.dart
import 'dart:io';

void alarm([String text]) {
  stderr.writeln(text ?? message);
}

String get message => 'Hello World from the VM!';

```

这是默认的实现，它是一个引发UnsupportedErrors的存根：


```dart

// lib/src/hw_none.dart

void alarm([String text]) => throw UnsupportedError('hw_none alarm');

String get message => throw UnsupportedError('hw_none message');

```

在任何平台上，您都可以导入具有条件导出代码的库：

```dart

import 'package:hw_mp/hw_mp.dart';

void main() {
  print(message);
}

```


## 提供其他文件

设计良好的库包易于测试。我们建议您使用测试包编写测试，并将测试代码放在包顶部的测试目录中。

> test

https://github.com/dart-lang/test


如果您创建任何供公众使用的命令行工具，请将其放置在bin目录中，该目录是公共的。使用pub global activate启用从命令行运行工具的功能。

在pubspec的可执行文件部分列出该工具后，用户无需调用pub global run就可以直接运行它。

https://dart.dev/tools/pub/cmd/pub-global#activating-a-package

https://dart.dev/tools/pub/pubspec#executables


如果提供一个示例，说明如何使用您的媒体库。这进入软件包顶部的示例目录。


发布程序包中介绍了将库发布到pub.dev站点时所需的其他文件，例如README.md和CHANGELOG.md。


有关如何组织软件包目录的更多信息，请参见pub软件包布局约定。

https://dart.dev/tools/pub/publishing

https://dart.dev/tools/pub/package-layout


## 文档化 library

https://github.com/dart-lang/dartdoc#dartdoc


https://dart.dev/guides/language/effective-dart/documentation#doc-comments


您可以使用dartdoc工具为您的库生成API文档。 Dartdoc解析源以查找使用///语法的文档注释：


```dart
/// The event handler responsible for updating the badge in the UI.
void updateBadge() {
  //...
}

```

有关生成文档的示例，请参见书架文档

https://pub.dev/documentation/shelf/latest


https://pub.dev/packages/shelf


https://github.com/dart-lang/shelf


**注意**：要在生成的文档中包括任何库级别的文档，必须指定库指令。请参阅问题1082。

https://github.com/dart-lang/dartdoc/issues/1082


