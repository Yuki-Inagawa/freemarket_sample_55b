## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|nickname|string|null: false|
|ruby|string|null: false|
|birthday|integer|null: false|
|mail|string|null: false, unique: true|
|password|string|null: false, unique: true|
|image|string|
|profile|text|
|address_id|reference|null: false|

### Association
- has_many :items
- has_many :values
- has_many :likes
- has_many :comments
- has_one :address

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|region|reference|null: false|
|municipality|string|null: false|
|address|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false|


### Association
- belongs_to :user
- has_one :region

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|name|string|null: false, index: true|
|price|integer|null: false|
|saler_id|integer|null: false|
|buyer_id|integer|
|statas|integer|null: false|
|state|string|null: false|
|postage|string|
|region_id|references|null: false|
|shopping_date|string|null: false|
|delivery_metohd|string|null: false|
|category_id|references|null: false|

### Association
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
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

## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestlry|references||

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