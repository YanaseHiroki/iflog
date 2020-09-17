# IFLOG

## 概要
### このアプリでできること

毎日、記録をするだけで、新しい習慣を身に着けることができます！  
  
最初に「日常的な動作」をしたら「身につけたい習慣をする」という計画を作ります！  
記録は1日の終わりに実践できた回数を選ぶだけです！  
  
連続日数や達成率などでモチベーションを高めながら、習慣を定着させます！

## 本番環境　テストアカウント
| 項目      | 情報                    |
| ------- | --------------------- |
| URL     | http://18.181.97.154/ |
| メールアドレス | sample@sample.com     |
| パスワード   | sample123             |

## 制作背景

親友がダイエットを継続できるようにアプリケーションを作成しました！ 

ダイエットというと食事制限やランニングなどをイメージすると思います。
しかし、ダイエットで健康になるためには、他にもさまざまな習慣が役立ちます。

ダイエットのための複数の習慣を管理して継続できるように、このアプリケーションを制作しました。

## DEMO
主な機能を実際に利用する様子を御覧ください！

- [アカウントを作成する](https://gyazo.com/7dadca602e43692e50d5f37eba81ec20)
- [習慣化するための計画を作成する](https://gyazo.com/27e0e8f975382d857200201b6c8ef1e8)
- [計画を編集する](https://gyazo.com/b15ff1b1f4c642754b89f8ddcd67d5cd)
- [記録を作成する](https://gyazo.com/c084e23f63317a126e58a009e0a39c82)
- [達成率を確認する](https://gyazo.com/2bf036149cd20eb384d6744363b1ab04)


## 工夫したポイント

科学的根拠にもとづいた習慣化のテクニックを簡単に実践できます！

- if thenプランニングで計画をたてる
- 目標を再確認する
- 記録を振り返り客観視する

機能をシンプルにして、気軽に使えるようにしました！  
また、デザインにゆとりをもたせて、PCでもスマホでも使いやすくしました！
 
## 開発環境

- macOS Catalina 10.15.6
- ruby 2.6.5
- Rails 6.0.3.2

## 課題や今後実装したい機能

- 完了画面の背景を設定  
- 記録の共有機能  
- 応援のことば送信機能  
- 改善のための豆知識表示機能  
- 機能リクエスト  
- 英語対応  
- 有料応援サービスのプラットホーム化  
- ハイブリッドアプリ化  

詳細は[要件定義（バックログ）](https://docs.google.com/spreadsheets/d/1oHi-bqbVLdo2Xz61wHPPGd-W_xaCKoI3LEHgxtrHK0I/edit?usp=sharing)をご覧ください！

## テーブル設計

### usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| image    | string |             |
| email    | string | null: false |
| password | string | null: false |

#### Association

- has_many :plans
- has_many :logs

### plansテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| target  | integer    | null: false                    |
| trigger | string     | null: false                    |
| habit   | string     | null: false                    |

#### Association

- belongs_to :user
- has_many :logs

### logsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| plan_id | references | null: false, foreign_key: true |
| result  | integer    | null: false                    |
| date    | date       | null: false                    |

#### Association

- belongs_to :user
- belongs_to :plan


## ローカルでの動作方法
このアプリケーションをお手元の環境にローカルサーバーを立てて動作させる場合、次のコマンドを実行してください。

### 手順
---
1. カレントディレクトリを複製先のディレクトリに移動します
（例：projectsというフォルダーに複製する場合）
```
% cd ~/projects
```
---
2. リモートリポジトリをローカル環境に複製します
```
% git clone https://https://github.com/YanaseHiroki/iflog
```
---
3. 複製されたディレクトリに移動します
```
% cd iflog
```
---
4. "Gemfile"に記述されたGemをインストールします
```
% bundle install
```
---
5. "yarn.lock"に記述されたパッケージをインストールします
```
% yarn install
```
---
6. データベースを新規作成します
```
% rails db:create
```
---
7. マイグレーションファイルを実行します
```
% rails db:migrate
```
---
8. ローカルサーバーを立ち上げます
```
% rails s
```
---
9. ブラウザでアプリケーションを開きます
```
% open "http://localhost:3000"
```