# アプリケーション名
ペット体調記録アプリ

# アプリケーション概要
ペットの健康管理の日々の食事量、運動時間、体重などを記録し、ペットの健康状態を一目で把握できます。

# URL
https://pet-health-diary.onrender.com

## テスト用アカウント
ユーザー名: testuser
パスワード: pass1234

## Basic 認証
ID: admin
Pass: 2222

## 利用方法
-ユーザー、ペット登録を行い、ログインします。
-「記録項目」ボタンからペットの日々の活動を記録します。
-トップページからカレンダーから記録を確認可能です。
-「投稿した日時を選択」で編集、消去することができます。
-「ギャラリー」ボタンから記録フォームから投稿した画像を見ることができます。
-「ニュース」ボタンからユーザーが食事、ワクチン、病名などの記事を書くことができます。

## 背景
-ペットの健康管理は飼い主にとって大切なことで、このアプリは、飼い主がペットの健康状態を簡単に理解し、必要な対応を迅速に行えるよう支援したいと思いこのアプリを作成しようと思いました。

##実装した機能についての画像やGIF
-日記機能: ペットの食事量、運動時間、体重を記録できます。

-レポート機能: 月間の健康データをグラフで表示します。

## 実装予定の機能
-複数のユーザーが同じペットの管理をできる機能を追加。

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/6efe83c9370f8aaefc973b0254ed1701.png)](https://gyazo.com/6efe83c9370f8aaefc973b0254ed1701)

## 画面遷移図

## 開発環境
-言語: Ruby, JavaScript
-フレームワーク: Ruby on Rails
-データベース: PostgreSQL
-デプロイ: Render

## ローカルでの動作方法
shell
Copy code
$ https://github.com/fujimasa0107/pet_health_diary.git
$ cd pet-health-diary
$ bundle install

## 改善点
-モバイル対応の向上。

## 制作時間
-約 ２週間半

# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
|--------------------|---------|--------------------------|
| name               | string  | null: false              |  
| email              | string  | null: false, unique: true|
| password           | string  | null: false              |
| encrypted_password | string  | null: false              |

### Association

-has_many :pets
-has_many :articles
-has_many :gallery

## pets テーブル

| Column  |  Type     | Options                        |
|---------|-----------|--------------------------------|
| user_id | integer   | null: false, foreign_key: true |
| name    | string    | null: false                    |
| age     | integer   | null: false                    |
| weight  | integer   |                                |
| gender  | string    |                                |

### Association

-belongs_to :user
-has_many :daily_logs
-has_many :health_checks

## daily_logs テーブル

| Column        | Type    | Options                        |
|---------------|---------|--------------------------------|
| pet_id        | integer | null: false, foreign_key: true |
| date          | date    | null: false                    |
| food_intake   | integer |                                |
| water_intake  | integer |                                |
| toilet_count  | integer |                                |
| exercise_time | integer |                                |
|image          | string  |                                |

### Association

-belongs_to :pet
-belongs_to :user

## articles テーブル

| Column   | Type    | Options                        |
|----------|---------|--------------------------------|
| id       | integer | null: false, primary key       |
| user_id  | integer | null: false, foreign_key: true |
| title    | string  | null: false                    |
| content  | text    | null: false                    |
| category | string  |                                |

### Association

  - belongs_to :user
  - has_many :checks

## gallery テーブル

|Column     | Type    | Options                        |
|-----------|---------|--------------------------------|
|id         | integer | null: false, primary key       |
|user_id    | integer | null: false, foreign_key: true |
|article_id | integer | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :daily_log
