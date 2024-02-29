# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ... #テーブル設計

## users テーブル

| Column | Type | Options |
| id | integer | null: false, primary key |
| name | string | null: false |  
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association

-has_many :pets
-has_many :articles
-has_many :favorites
-has_many :reminders

## pets テーブル

| Column | Type | Options |
| id | integer | null: false, primary key |
| user_id | integer | null: false, foreign_key: true |
| name | string | null: false |
| age | integer | null: false |
| weight | integer | |
| gender | string | |

### Association

-belongs_to :user
-has_many :daily_logs
-has_many :health_checks

## daily_logs テーブル

| Column | Type | Options |
| id | integer | null: false, primary key |
| pet_id | integer | null: false, foreign_key: true |
| date | date | null: false |
| food_intake | integer | |
| water_intake | integer | |
| toilet_count | integer | |
| exercise_time | integer | |
|image | string | |

### Association

-belongs_to :pet

## articles テーブル

| Column | Type | Options |
| id | integer | null: false, primary key |
| user_id | integer | null: false, foreign_key: true |
| title | string | null: false |
| content | text | null: false |
| category | string | |

### Association

-belongs_to :user
-has_many :favorites

## favorites テーブル

|Column | Type | Options |
|id | integer | null: false, primary key |
|user_id | integer | null: false, foreign_key: true |
|article_id | integer | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :article

## reminders テーブル

|Column| Type | Options|
|id |integer | null: false, primary key |
|user_id |integer | null: false, foreign_key: true |
|title |string | null: false |
|description |text | |
|reminder_date |date | null: false |

### Association

-belongs_to :user
