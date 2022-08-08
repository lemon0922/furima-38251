# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| nickname           | string | null: false             |
| email              | string | null: false, uni: false |
| encrypted_password | string | null: false             |
| first_name         | string | null: false             |
| family_name        | string | null: false             |
| read_first         | string | null: false             |
| read_family        | string | null: false             |
| birth              | string | null: false             |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| content      | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| burden_id    | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| day_id       | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order


## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one    :address


## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| category_id    | integer    | null: false                    |
| municipality   | string     | null: false                    |
| house_num      | string     | null: false                    |
| building_name  | string     |                                |
| phone_num      | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association

- has_one    :address