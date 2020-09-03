# IFLOG

# フリマアプリ FURIMA_28335

## 概要
### このアプリでできること

何かをする習慣を身に着けることができます！

◇ ストーリー
1. 「〇〇したら、□□の習慣をする」形式で計画を作る！
2. 1日1回、実践できた時間選ぶだけ！
3. 継続日数に応じて応援のメッセージがもらえる！
4. 直近の20日を振り返って習慣の定着度が点数で表示される！

## 本番環境(デプロイ先　テストアカウント＆ID)
| 項目  | 情報 |
| --  | --  |
| 自身のフリマアプリのURL | 　　 |
| Basic認証のID |  administrator |
| Basic認証のパスワード |  31415926535 |
| 出品者用のメールアドレス | sample@sample.com |
| 出品者用のパスワード | sample123 |
| 購入者用のメールアドレス | test@test.com |
| 購入者用のパスワード | test123 |


## 制作背景(意図)

ダイエット中の親友のために、運動の習慣を継続するためのアプリケーションを作成しました！

## DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)

--

## 工夫したポイント

シンプルで手軽に使えるように作成しました！
科学的根拠にもとづいた習慣化のテクニックを実践できます！

- if thenプランニング
- 記録を振り返り客観視する
- 目標を再確認する
 
## 使用技術(開発環境)

- macOS Catalina 10.15.6
- ruby 2.6.5
- Rails 6.0.3.2

## 課題や今後実装したい機能

− 完了画面の背景を設定
− １日の記録を表示
− 記録の共有機能
− 応援のことば送信機能
− 豆知識表示機能
− 機能リクエスト
− 英語対応
− 有料応援サービスのプラットホーム化
− ハイブリッドアプリ化

## テーブル設計

### usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |

#### Association

- has_many :plans

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
| plan_id | references | null: false, foreign_key: true |
| date    | date       | null: false                    |
| hour    | integer    | null: false                    |

#### Association

- belongs_to :plan


## ローカルでの動作方法
お手元のローカル環境で動作させるためには、次のコマンドを実行してください。

### 手順

1. カレントディレクトリを複製先のディレクトリに移動します
（例：projectsフォルダー配下に複製する場合）
```
% cd ~/projects
```
2. リモートリポジトリをローカル環境に複製します
```
% git clone https://https://github.com/YanaseHiroki/iflog
```
3. 複製されたディレクトリに移動します
```
% cd iflog
```
4. "Gemfile"に記述されたGemをインストールします
```
% bundle install
```
5. "yarn.lock"に記述されたパッケージをインストールします
```
% yarn install
```
6. データベースを新規作成します
```
% rails db:create
```
7. マイグレーションファイルを実行します
```
% rails db:migrate
```
8. ローカルサーバーを立ち上げます
```
rails s
```
9. ブラウザでアプリケーションを開きます
```
open "http://localhost:3000"
```