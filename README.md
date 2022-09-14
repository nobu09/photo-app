# README
写真管理アプリケーション（ツイート機能付き）です

## ローカル環境構築
- ローカルに、Ruby 3.1.2 をインストールする
- https://github.com/nobu09/photo-app からクローンし、以下のコマンドを実行

```ruby
cd photo-app
gem install bundler  # bundlerが未インストールの場合のみ
bundle install
bin/rails javascript:install:esbuild
bin/rails css:install:bootstrap
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed # 初期データ投入
```

## ローカル実行方法
- 外部連携APIのBASEのURL（ENDPOINT_URL）、CLIENT_ID（クライアントID）、CLIENT_SECRET（クライアントシークレット）の環境変数で与えて、bin/dev で起動する

```ruby
ENDPOINT_URL="https://xxxxxx" CLIENT_ID="xxxxxxx" CLIENT_SECRET="xxxxxxx" bin/dev
```

- http://localhost:3000 にアクセスするとログイン画面が表示される
- 以下の情報でログイン可能
  - ユーザーID: `user1` or `user2`
  - パスワード: `P@ssw0rd`

## Ruby / Rails version
- Ruby: 3.1.2
- Ralis: 7.0.4

## テスト実行方法
```ruby
bin/rails test
```
