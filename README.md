# README
# ER図 URL https://gyazo.com/5e8a5ecbef3e981ce32a9ace42b0c44b
## users table

| Column             | Type                | Options                            |
|--------------------|---------------------|------------------------------------|
| nickname           | string              | null: false                        |
| email              | string              | null: false                        |
| password           | string              | null: false                        |
| last_name          | string              | null: false                        |
| last_name_kana     | string              | null: false                        |
| first_name         | string              | null: false                        |
| first_name_kana    | string              | null: false                        |
| birthday           | integer             | null: false                        |
| item               | references          | foreign_key: true                  |
| buy                | references          | foreign_key: true                  |

### Association
* has_many  :items
* has_many  :buys

## items table

|Column              |Type                 |Options                            |
|--------------------|---------------------|-----------------------------------|
|seller_name         |string               |null: false                        |
|explanation         |text                 |null: false                        |
|detalise            |string               |null: false                        |
|delivery            |string               |null: false                        |
|price               |string               |null: false                        |
|user                |references           |foreign_key: true                  |
|buy                 |references           |foreign_key: true                  |

### Association
* belong_to :users
* has_one   :buys

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
* has_one   :items
* has_one   :addresses

## addresses table

|Column              |Type                 |Options                            |
|--------------------|---------------------|-----------------------------------|
|potal_code          |string               |null: false                        |
|prefectures         |string               |null: false                        |
|municipalities      |string               |null: false                        |
|house_number        |string               |null: false                        |
|bilding_name        |string               |null: false                        |
|buy                 |references           |foreign_key: true                  |

### Association
* has_one   :buys