# README

# テーブル設計

## users_table

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               | 
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |      


### Association

- has_many :items
- has_many :orders

## items_table

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| title              | string       | null: false                    |
| description        | text         | null: false                    |
| user               | references   | null: false, foreign_key: true |
| category_id        | integer      | null: false                    |
| status_id          | integer      | null: false                    |
| charge_id          | integer      | null: false                    |
| area_id            | integer      | null: false                    |   
| send_day_id        | integer      | null: false                    |
| price              | integer      | null: false                    |

### Association

- belongs_to :user
- has_one :order


## orders table

| Column    | Type       | Options                        |
| --------- | ---------- | -------------------------------|
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses table

| Column        | Type       | Options                        |
| ------------- | ---------- | -------------------------------|
| postal_code   | string     | null: false                    |
| area_id       | integer    | null: false                    |
| city          | string     | null: false                    |
| place         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

