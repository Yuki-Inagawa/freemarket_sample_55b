
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|nickname|string|null: false|
|ruby|string|null: false|
|birthday|integer|null: false|
|postal_code|string|null: false|
|municipality|string|null: false|
|address|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false|
|mail|string|null: false, unique: true|
|password|string|null: false, unique: true|
|image|string|
|text|text|

### Association
- has_many :items
- has_many :values
- has_many :likes
- has_many :comments

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|name|string|null: false, index: true|
|price|integer|null: false|
|saler_id|integer|null: false|
|buyer_id|integer|
|transaction|integer|
|statas|integer|null: false|
|transaction_stop|integer|
|state_id|references|null: false, foreign_key: true|
|postage_id|references|null: false, foreign_key: true|
|region_id|references|null: false, foreign_key: true|
|shopping_date_id|references|null: false, foreign_key: true|
|delivery_metohd_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :like
- belongs_to :state
- belongs_to :region
- belongs_to :shopping_date
- belongs_to :postage
- belongs_to :delivery_method
- belongs_to :category

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

## statesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items

## shopping_datesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true|

### Association
- has_many :items

## posgatesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items

## regionsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

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