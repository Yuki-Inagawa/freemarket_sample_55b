*概要
フリーマーケットサービス　メルカリのコピーサイトです。

お手数ですが詳しくは下記ドキュメントを参照して下さい。

https://docs.google.com/document/d/15z49b4aul08EHtPzDS4wS7NxN-cMjYGIvIs3Pk7YouU/edit

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|nickname|string|null: false|
|family_name_ruby|string|null: false|
|first_name_ruby|string|null: false|
|birthday_year|integer|null: false| 
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|mail|string|null: false, unique: true|
|image|string|
|profile|text|

### Association
- has_many :items
- has_many :values
- has_many :likes
- has_many :comments
- has_one :address
- has_many :cards
- has_many :transaction


## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|postal_code|string|null: false|
|region|string|null: false|
|city|string|null: false|
|address_number|string|null: false|
|building_name|string|
|phone_number|string|

### Association
- belons_to :user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false|
|text|text|null: false|
|name|string|null: false, index: true|
|price|integer|null: false|
|status|integer|null: false|
|state|string|null: false|
|postage_type|string|null: false|
|region|string|null: false|
|shopping_date|string|null: false|
|delivery_metohd|string|null: false|
|category_id|references|null: false|
|brand_id|references|null: false|

### Association
- belongs_to :user
- has_many :likes
- belons_to :category
- has_one :transaction
- has_many :images

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestlry|references|

### Association
- has_many : ancestlry
- has_many : items

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true|

### Association
- has_many :items


## valuesテーブル

|Column|Type|Options|
|------|----|-------|
|assessment|integer|
|comment|text|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_id|string|null: false|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|

### Association
- belongs_to :user
- belongs_to :transaction

## transactionsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|reference|null: false|
|image|string|null: false|

### Association
- belongs_to :item
