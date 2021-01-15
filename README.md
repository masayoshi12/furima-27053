# README
## users table

| Column             | Type                | Options                            |
|--------------------|---------------------|------------------------------------|
| nickname           | string              | null: false                        |
| email              | string              | null: false                        |
| encrypted_password | string              | null: false                        |
| last_name          | string              | null: false                        |
| last_name_kana     | string              | null: false                        |
| first_name         | string              | null: false                        |
| first_name_kana    | string              | null: false                        |
| birthday           | date                | null: false                        |

### Association
* has_many  :items
* has_many  :buys

## items table

|Column              |Type                 |Options                            |
|--------------------|---------------------|-----------------------------------|
|explanation         |text                 |null: false                        |
|detalise            |string               |null: false                        |
|delivery            |string               |null: false                        |
|price               |string               |null: false                        |
|user                |references           |foreign_key: true                  |

### Association
* belong_to :users
* has_one   :buy

## buys table

|Column              |Type                 |Options                            |
|--------------------|---------------------|-----------------------------------|
|buyer_info          |string               |null: false                        |
|item_info           |string               |null: false                        |
|user                |references           |foreign_key: true                  |
|item                |references           |foreign_key: true                  |
|address             |references           |foreign_key: true                  |

### Association
* belong_to :users
* has_one   :item
* has_one   :address

## addresses table

|Column              |Type                 |Options                            |
|--------------------|---------------------|-----------------------------------|
|potal_code          |string               |null: false                        |
|prefectures_id      |integer              |null: false                        |
|municipalities      |string               |null: false                        |
|house_number        |string               |null: false                        |
|bilding_name        |string               |                                   |
|phone_number        |string               |null: false                        |
|buy                 |references           |foreign_key: true                  |

### Association
* has_one   :buy