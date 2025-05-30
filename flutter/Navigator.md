# 画面遷移の全体像
Flutterでは、`Navigator`というクラスに対して、`Route`クラスでラップしたページを渡す事でページ遷移を行う。

`Navigator`クラスは、全てのページを入れる容器のようなもの。
ページ遷移を実装するという事は、その容器にページをどんどん積み重ねていく（スタックする）イメージである。

# 実際のコード
以下が、最も基本的な画面遷移のコードである。

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => PageB()
  )
);
```

`Navigator`クラスの`push`メソッドに、`PageB`クラスをラップした`MaterialPageRoute`クラスを渡している。

これにより、`Navigator`クラスに`PageB`クラスがスタックされ、ユーザー画面には`PageB`が表示される。


## MaterialPageRouteクラス
`MaterialPageRoute`は、前述のRouteクラスを継承したクラス。
マテリアルデザインに沿ったページ遷移を行うためのクラスである。

この`MaterialPageRoute`の`builder`パラメータは、コールバック関数を受け取り、その返り値として`Navigator`クラスに渡したいページを指定する。

```dart
MaterialPageRoute(
  builder: (context) => PageB()
)
```

この画面遷移処理を、ボタンのonTapプロパティに指定することで、「ボタンをクリック => NavigatorにPageBをスタックする（PageBへ画面遷移する）」機能を実装することが可能である。

```dart
FloatingActionButton(
  onTap: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PageB();
      )
    );
  };
)
```

# Navigatorクラスの様々なメソッド
## push
前述した、最も基本的な「次のページに遷移する（NavigatorにRouteオブジェクトをスタックする）」メソッドである。

## pop
「前のページに遷移する（Navigatorの最上にスタックされているRouteオブジェクトを削除）」メソッドである。
その結果、その次にスタックされているRouteオブジェクトが表示される。

```dart
Navigator.of(context).pop();
```

## pushReplacement
「現在のページを新しいページと入れ替える」メソッドである。

一番上にスタックされているRouteオブジェクトを、新しいRouteオブジェクトに差し替える。（元のRouteオブジェクトは破棄されるため、popなどで戻ることは不可）

```dart
Navigator.of(context).pushReplacement(
  MaterialPageRoute(
    builder: (context) => PageB();
  )
)
```

## pushAndRemoveUntil
「次のページに遷移しつつ、特定の条件のページまで過去のページを削除する」メソッドである。

第一引数に、遷移先のRouteオブジェクトを渡す。
第二引数に、取り除くRouteオブジェクトの条件を渡す。

スタックされているRouteオブジェクトの上から順に条件式が適用されていき、trueが返ってくるまでRouteオブジェクトを破棄し続ける。

```dart
// PageDに遷移しつつ、全ての過去のページを取り除く
Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(
    builder: (context) => PageD()
  ),
  (route) => false
);

// PageDに遷移しつつ、パス名が'/home'のページに辿り着くまで過去のページを取り除く
Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(
    builder: (context) => PageD()
  ),
  (route) => route.settings.name == '/home'
);
```

## popUntil
「指定のページまで一気に戻る」メソッドである。

引数にコールバック関数を渡し、そのコールバック関数がtrueを返すまでスタックされているRouteオブジェクトを取り除く。

```dart
// 特定のページまで戻る
Navigator.of(context).popUntil((route) => route.settings.name == '/user');

// 一番最初のページまで戻る
Navigator.of(context).popUntil((route) => route.isFirst);
```
