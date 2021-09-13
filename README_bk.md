# README

# テーブル設計

## users_table

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false | 


### Association

- has_many :items
- has_many :orders

## items_table

| Column             | Type         | Options     |
| ------------------ | ------------ | ----------- |
| title              | string       | null: false |
| price              | integer      | null: false |
| user               | references   | null: false |
| category           | string       | null: false |
| status             | text         | null: false |
| charge             | integer      | null: false |
| area               | string       | null: false |
| send_day           | integer      | null: false |

### Association

- belongs_to :user
- belongs_to :order


## orders table

| Column    | Type       | Options     |
| --------- | ---------- | ------------|
| user      | references | null: false |
| item      | references | null: false |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address


## address table

| Column        | Type       | Options     |
| ------------- | ---------- | ------------|
| postal_code   | string     | null: false |
| prefecture    | string     | null: false |
| city          | string     | null: false |
| place         | string     | null: false |
| building      | string     |             |
| phone_number  | string     | null: false |

### Association

- belongs_to :order