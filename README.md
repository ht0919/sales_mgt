# Elixir+PhoenixによるWebアプリの作例(2)

- 2つのテーブルを連携させたWebアプリの作例です。
- テーブル構成
  - 商品マスタ(items)：商品名(name:string)、単価(price:integer)
  - 売上データ(sales)：日付(date:date)、商品ID(item_id:integer)、個数(qty:integer)


## 動作環境(バージョン)

- 環境構築の作業手順は[blog](https://github.com/ht0919/blog)を参照して下さい。
  - macOS: 10.13
  - PostgreSQL: 9.6.5
  - Node.js: 8.7.0
  - Elixir: 1.5.2
  - Phoenix: 1.3.0


## プロジェクトの作成

1. プロジェクトの作成とディレクトリの移動
```
$ mix phoenix.new sales_mgt
$ cd sales_mgt
```

2. データベースの作成
```
$ mix ecto.create
```

3. サーバーの起動と動作確認
```
$ mix phoenix.server
```
  - ブラウザで「[http://localhost:4000/](http://localhost:4000/)」を表示
  - Ctrl+Cを2回押してサーバーを停止

  ![img01.png](https://raw.githubusercontent.com/ht0919/sales_mgt/master/images/img01.png)


## 商品マスタの作成

1. CRUDコードの作成(Scaffold)
```
$ mix phoenix.gen.html Item items name:string price:integer
```

2. HTTPアクセスポイントの追加
  - テキストエディタで「web/router.ex」を開く
  - 19行目の「get "/", PageController, :index」の下に「resources "/items", ItemController」を追加して保存する
```
19:    get "/", PageController, :index
20:    resources "/items", ItemController
21:  end
```

3. モデルのマイグレーション
```
$ mix ecto.migrate
```

4. サーバーの起動と動作確認
```
$ mix phoenix.server
```
  - ブラウザで「[http://localhost:4000/items](http://localhost:4000/items)」を表示
  - 新規登録(New post)、詳細表示(Show)、変更(Edit)、削除(Delete)を一通り試す
  - Ctrl+Cを2回押してサーバーを停止

  ![img02.png](https://raw.githubusercontent.com/ht0919/sales_mgt/master/images/img02.png)


## 売上データの作成

1. CRUDコードの作成(Scaffold)
```
$ mix phoenix.gen.html Sale sales date:date item_id:integer qty:integer
```

2. HTTPアクセスポイントの追加
  - テキストエディタで「web/router.ex」を開く
  - 20行目の「resources "/items", ItemController」の下に「resources "/sales", ItSaleController」を追加して保存する
```
19:    get "/", PageController, :index
20:    resources "/items", ItemController
21:    resources "/sales", ItSaleController
22:  end
```

3. モデルのマイグレーション
```
$ mix ecto.migrate
```

4. サーバーの起動と動作確認
```
$ mix phoenix.server
```
  - ブラウザで「[http://localhost:4000/sales](http://localhost:4000/sales)」を表示
  - 新規登録(New post)、詳細表示(Show)、変更(Edit)、削除(Delete)を一通り試す
  - Ctrl+Cを2回押してサーバーを停止

  ![img03.png](https://raw.githubusercontent.com/ht0919/sales_mgt/master/images/img03.png)


## 2つのテーブルを連携

- これから作成する予定です。
