# IFLOG

## 概要
### このアプリでできること

何かをする習慣を身に着けることができます！

◇ ストーリー
1.「日常的な動作」をしたら「身につけたい習慣をする」という形式で計画を作る！（if thenプランニング）
2. 1日1回、実践できた回数を選ぶだけ！
3. 継続日数に応じて応援のメッセージがもらえる！
4. 直近の20日を振り返って習慣の定着度が点数で表示される！

## 本番環境
| 項目---            | 情報          |
| --------------- | ----------- |
| 自身のオリジナルアプリのURL | 9/12にAWSでデプロイ予定 |


## 制作背景

ダイエット中の親友のために、運動の習慣を継続するためのアプリケーションを作成しました！

## DEMO
主な機能を実際に利用する様子を御覧ください！

[アカウントを作成する](https://gyazo.com/7dadca602e43692e50d5f37eba81ec20)
[習慣化するための計画を作成する](https://gyazo.com/27e0e8f975382d857200201b6c8ef1e8)
[計画を編集する](https://gyazo.com/b15ff1b1f4c642754b89f8ddcd67d5cd)
[記録を作成する](https://gyazo.com/c084e23f63317a126e58a009e0a39c82)
[達成率を確認する](https://gyazo.com/2bf036149cd20eb384d6744363b1ab04)


## 工夫したポイント

科学的根拠にもとづいた習慣化のテクニックを簡単に実践できます！

- if thenプランニング
- 記録を振り返り客観視する
- 目標を一覧表示で再確認する

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
| image    | string | null: false |
| email    | string | null: false |
| password | string | null: false |

#### Association

- has_many :plans
- has_many :logs

### plansテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| habit   | string     | null: false                    |
| trigger | string     | null: false                    |
| target  | integer    | null: false                    |

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