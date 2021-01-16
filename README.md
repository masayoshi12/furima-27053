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
|prefecture_id       |integer              |null: false                        |
|day_id              |integer              |null: false                        |
|price               |integer              |null: false                        |
|user                |references           |foreign_key: true                  |

### Association
* belongs_to :user
* has_one   :buyer

## buyers table

|Column              |Type                 |Options                            |
|--------------------|---------------------|-----------------------------------|
|user                |references           |foreign_key: true                  |
|item                |references           |foreign_key: true                  |

### Association
* belongs_to :user
* belongs_to :item
* has_one   :address

## addresses table

|Column              |Type                 |Options                            |
|--------------------|---------------------|-----------------------------------|
|postal_code         |string               |null: false                        |
|prefecture_id       |integer              |null: false                        |
|municipalities      |string               |null: false                        |
|house_number        |string               |null: false                        |
|building_name       |string               |                                   |
|phone_number        |integer              |null: false                        |
|buyer               |references           |foreign_key: true                  |

### Association
* belongs_to   :buyer