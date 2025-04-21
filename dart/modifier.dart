void main() {
  // constの基本文法
  const int a = 1;
  print(a); // => 1
  const String message = "Hello, World";
  print(message); // => Hello, World

  // finalの基本文法
  final bool messageIsEmpty = message.isEmpty;
  print(messageIsEmpty); // => false

  // varの基本文法
  var helloWorldMessage = "Hello World";
  helloWorldMessage = "こんにちは、世界";
  print(helloWorldMessage); // => こんにちは、世界

  // lateの基本文法
  late int id;
  id = 1;
  print(id); // => 1
}
