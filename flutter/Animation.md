## アニメーション
Flutterにはアニメーションを扱うことができるWidgetが存在する。
一般的なアニメーションを扱えるWidgetは、大きく2種類に分類される。

- パラメタの設定のみで扱えるAnimated系
- AnimationControllerとセットで利用することで、細かい制御が可能なTransition系

## Animated Widget

- AnimatedOpacity：Opacity（透明度）をアニメーションで切り替える
- AnimatedSize：サイズをアニメーションで切り替える
- AnimatedAlign：位置をアニメーションで切り替える

durationプロパティを定義することで、どの程度の時間を掛けて変化するかを指定することが可能。

例）文字の透明度やSizedBoxのサイズ・位置をボタンクリックで切り替える

```dart
class _MyHomePageState extends State<MyHomePage> {
  bool _flag = false;

  // ボタンタップ時に変数の真偽値を反転する
  _click() async {
    setState(() {
      _flag = !_flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              opacity: _flag ? 0.1 : 1.0,
              duration: const Duration(seconds: 3)
            )
          ]
        )
      )
    );
  }
}
```

- AnimatedContainer：複数のWidgetを1つのコンテナとしてまとめてアニメーションにする
- AnimatedSwitcher：2つの異なるWidgetをアニメーションで切り替えが出来る

```dart
body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      AnimatedContainer(
        duration: const Duration(seconds: 3),
        width: _flag ? 100 : 50,
        height: _flag ? 50: 100,
        padding: _flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
        margin: _flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
        transform: _flag ? Matrix4.skewX(0.0) : Matrix4.skewX(0.3),
        color: _flag ? Colors.amber : Colors.grey
      ),
      AnimatedSwitcher(
        duration: const Duration(seconds: 3),
        child: _flag ? const Text('何もない') : const Icon(Icons.favorite, color: Colors.pinkAccent)
      )
    ]
  )
)
```

- EdgeInsets：余白を追加するクラス（列挙型）、paddnig・marginプロパティで設定可能。
- transform：Flutterウィジェットに対して、様々な変形を適用するためのプロパティ。回転・拡大縮小・傾斜（スキュー）・移動が可能になる。
