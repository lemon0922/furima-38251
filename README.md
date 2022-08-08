# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| nickname           | string | null: false             |
| email              | string | null: false, uni: false |
| encrypted_password | string | null: false             |
| name               | string | null: false             |
| birthday           | string | null: false             |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| content    | text       | null: false                    |
| category   | text       | null: false                    |
| value      | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| items        | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |
| address      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one    :address

## address テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| order  | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |