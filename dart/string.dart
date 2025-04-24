void main() {
  // lengthプロパティ 文字列の長さを取得
  const String str = "Hello World";
  print(str.length); // <= 11

  // substringメソッド 指定された位置からの文字列を切り出し
  final String str2 = str.substring(6);
  print(str2); // <= World

  // toUpperCaseメソッド 大文字に変換
  final String str3 = str.toUpperCase();
  print(str3); // <= HELLO WORLD

  // toLowerCaseメソッド 小文字に変換
  final String str4 = str.toLowerCase();
  print(str4); // <= hello world

  // isEmptyプロパティ 文字列が空であるかどうか判断
  final bool str5 = str.isEmpty;
  print(str5); //  <= false

  // isNotEmptyプロパティ 文字列が空でないかどうか判断
  final bool str6 = str.isNotEmpty;
  print(str6); // <= true

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
