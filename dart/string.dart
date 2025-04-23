void main() {
  // lengthプロパティ 文字列の長さを取得
  const String str = "Hello World";
  print(str.length);

  // substringメソッド 指定された位置からの文字列を取得
  final String str2 = str.substring(6);
  print(str2);

  // 演算子+ 文字列の連結
  final String str7 = str + str;
  print(str7);

  // 演算子* 文字列の繰り返し
  final String str8 = str * 3;
  print(str8);

  // 演算子== 文字列の比較
  final bool str9 = (str == "Hello World");
  print(str9);

  // [] 配列の要素を取得
  final String str10 = str[0];
  print(str10);

  // $ 変数を展開
  final String str11 = "$str $str";
  print(str11);

  // joinメソッド 配列内の要素を結合
  final List<String> strs = ["Hello", "World"];
  final String str12 = strs.join();
  print(str12);
}
