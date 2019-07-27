## usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|nickname|string|null: false|
|family_name_ruby|string|null: false|
|first_name_ruby|string|null: false|
|birthday|integer|null: false| #年月日で分ける方が良い？
|mail|string|null: false, unique: true|
|image|string|
|profile|text|
|value_id|reference|

### Association
- has_many :items, through: transactions
- has_many :values
- has_many :likes
- has_many :comments
- has_one :address
- has_many :cards

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false|
|postal_code|string|null: false|
|region|reference|null: false|
|city|string|null: false|
|address_number|string|null: false|
|building_name|string||
|phone_number|string|

### Association
- belons_to :user
- belongs_to :region

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false|
|text|text|null: false|
|image_id|reference|null: false|
|name|string|null: false, index: true|
|price|integer|null: false|
|statas|integer|null: false|
|state|string|null: false|
|postage|string|
|region_id|references|null: false|
|shopping_date|string|null: false|
|delivery_metohd|string|null: false|
|category_id|references|null: false|

### Association
- has_many :users, through: transactions
- has_many :likes
- has_one :region
- belons_to :category

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

## regionsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- belongs_to :user
- belongs_to :item

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
|image|string|null: false|

### Association
- belongs_to :item