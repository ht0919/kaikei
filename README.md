# Ruby on Rails による会計管理(v.0.1.0)

Ruby on Railsの練習用に作成した会計管理システムです。現時点では経費帳の機能のみを実装しています。経費データは、勘定科目マスタを参照しています。このため経費データを登録する前に、あらかじめ勘定科目を登録する必要があります。

##  動作確認環境

1. OS : macOS Sierra v.10.12.1
2. Ruby : 2.3.1
3. Rails : 4.2.2
4. Bundler : 1.13.6
5. Git : 2.10.1

##  ダウンロードと起動方法

```
$ git clone https://github.com/ht0919/kaikei.git kaikei
$ cd kaikei
$ bin/rails s
```

## アクセス方法

1. ブラウザを起動
2. アドレス欄に「http://localhost:3000/」と入力して経費一覧を表示

## データベースの構造

1. 科目マスター(kamoku) → 科目名
2. 経費データ(keihi) → 日付、科目ID、適用、金額

## ===== 作成手順の記録 =====

## プロジェクトの作成

```
$ rails new kaikei
$ cd kaikei
```
### Gemファイルの編集

- テキストエディタでGemfileを開いて下記のように編集する

```
source 'https://rubygems.org'

gem 'rails',        '4.2.2'
gem 'sass-rails',   '5.0.2'
gem 'uglifier',     '2.5.3'
gem 'coffee-rails', '4.1.0'
gem 'jquery-rails', '4.0.3'
gem 'turbolinks',   '2.3.0'
gem 'jbuilder',     '2.2.3'
gem 'sdoc',         '0.4.0', group: :doc

group :development, :test do
  gem 'sqlite3',      '1.3.9'
  gem 'byebug',       '3.4.0'
  gem 'web-console',  '2.0.0.beta3'
  gem 'spring',       '1.1.3'
end
```

### gemのインストール

- $ bundle install

## スキャッフォルドの作成

```
$ bin/rails g scaffold kamoku name:string
$ bin/rails g scaffold keihi date:date kamoku_id:references tekiyou:string kingaku:integer
```

## データベースの作成

```
$ bin/rake db:migrate
```

### Gitの初期化

```
$ git init
$ git add -A
$ git commit -m "Initialize repository"
$ git status
```

## GitHubに登録(※Webで「kaikei」リポジトリを作成後に実行)

```
$ git remote add origin https://github.com/ユーザID/kaikei.git
$ git push origin master
```
- 初回登録時にユーザIDとパスワードを入力（※エコーバックされないので要注意）

## newで科目をセレクタに変更

- app/views/keihis/_form.html.erbの修正(-)

```
<div class="field">
 <%= f.label :kamoku_id %>
 <%= f.collection_select(:kamoku_id, Kamoku.all, :id, :name) %>
</div>
```

- GitHubにPush

```
$ git add -A
$ git commit -m "Chg View New and Edit"
$ git push origin master
```

## indexで科目を表示

- app/views/keihis/index.html.erbの修正(-)

```
<td><%= keihi.kamoku.name %></td>
```

- GitHubにPush

```
$ git add -A
$ git commit -m "Chg View Index"
$ git push origin master
```

## showで科目を表示

- app/views/keihis/show.html.erbの修正(-)

```
<p>
  <strong>Kamoku:</strong>
  <%= @keihi.kamoku.name %>
</p>
```

- GitHubにPush

```
$ git add -A
$ git commit -m "Chg View Show Kamoku"
$ git push origin master
```

### Railsで日本語化対応にする方法（submitボタンの日本語化）

- http://qiita.com/kusu_tweet/items/b534c808ac1ee0382f05

## ラベルの日本語化（科目）

1. app/views/kamokus/index.html.erbの修正
2. app/views/kamokus/show.html.erbの修正
3. app/views/kamokus/_form.html.erbの修正
4. app/views/kamokus/edit.html.erbの修正
5. app/views/kamokus/new.html.erbの修正

## ラベルの日本語化（経費）

1. app/views/keihis/index.html.erbの修正
2. app/views/keihis/show.html.erbの修正
3. app/views/keihis/_form.html.erbの修正
4. app/views/keihis/edit.html.erbの修正
5. app/views/keihis/new.html.erbの修正

```
$ git add -A
$ git commit -m "localized for japanese"
$ git push origin master
```

### リンクの追加

1. app/views/keihis/index.html.erb
2. app/views/kamokus/index.html.erb
4. GitHubにPush

```
$ git add -A
$ git commit -m "Add Link to Keihi and Kamoku"
$ git push origin master
```

## ルートルーティングの設定

- 　config/routes.rbの修正(4行目を追加)

```
Rails.application.routes.draw do
  resources :keihis
  resources :kamokus
  root 'keihis#index'
```

- GitHubにPush

```
$ git add -A
$ git commit -m "Add root routing"
$ git push origin master
```

## 勘定科目の登録

- 科目の新規登録で、必要に応じて下記のような勘定科目を登録する

  1. 旅費交通費
  2. 消耗品費
  3. 新聞図書費
  4. 雑費
  5. 接待交際費
  6. 水道光熱費
  7. 通信費
  8. 車両費
  9. 支払利息
  10. 事業主貸
  11. 現金
  12. 普通預金
