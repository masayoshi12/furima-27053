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
* has_many  :buyers

## items table

|Column              |Type                 |Options                            |
|--------------------|---------------------|-----------------------------------|
|product_name        |string               |null: false                        |
|explanation         |text                 |null: false                        |
|category_id         |integer              |null: false                        |
|state_id            |integer              |null: false                        |
|fee_id              |integer              |null: false                        |
|prefectures_id      |integer              |null: false                        |
|days_id             |integer              |null: false                        |
|price               |integer              |null: false                        |
|user                |references           |foreign_key: true                  |

### Association
* belong_to :user
* has_one   :buy

## buyers table

|Column              |Type                 |Options                            |
|--------------------|---------------------|-----------------------------------|
|buyer_info          |string               |null: false                        |
|item_info           |string               |null: false                        |
|user                |references           |foreign_key: true                  |
|item                |references           |foreign_key: true                  |
|address             |references           |foreign_key: true                  |

### Association
* belong_to :user
* has_one   :item
* has_one   :address

## addresses table

|Column              |Type                 |Options                            |
|--------------------|---------------------|-----------------------------------|
|postal_code         |string               |null: false                        |
|prefectures_id      |integer              |null: false                        |
|municipalities      |string               |null: false                        |
|house_number        |string               |null: false                        |
|building_name       |string               |                                   |
|phone_number        |integer              |null: false                        |
|buyer               |references           |foreign_key: true                  |

### Association
* has_one   :buyer