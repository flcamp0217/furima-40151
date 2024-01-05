# テーブル設計

##users テーブル
|Column                     |Type             |Options                          |
|---------------------------|-----------------|---------------------------------|
|nickname                   |string           |null : false                     |
|email                      |string           |null : false , unique : true     |
|encrypted_password         |string           |null : false                     |
|kanji_name                 |string           |null : false                     |
|kana_name                  |string           |null : false                     |
|birth_day                  |date             |null : false                     |
### Association
- has_many : items
- has_many : purchases

##Items テーブル
|Column                     |Type             |Options                          |
|---------------------------|-----------------|---------------------------------|
|item_name                  |string           |null : false                     |
|item_show                  |text             |null : false                     |
|category_id                |integer          |null : false                     |
|quality_id                 |integer          |null : false                     |
|postage_id                 |integer          |null : false                     |
|shipping_area_id           |integer          |null : false                     |
|delivery_time_id           |integer          |null : false                     |
|price                      |integer          |null : false                     |
|user                       |references       |null : false , foreign_key: true |
### Association
- belongs_to : user
- has_one : purchase

##Purchases テーブル
|Column                     |Type             |Options                          |
|---------------------------|-----------------|---------------------------------|
|user                       |references       |null : false , foreign_key: true |
|item                       |references       |null : false , foreign_key: true |
### Association
- belongs_to : user
- belongs_to : item
- belongs_to : shipping_info

##Shipping_infos テーブル
|Column                     |Type             |Options                          |
|---------------------------|-----------------|---------------------------------|
|postcode                   |integer          |null : false                     |
|shipping_area_id           |integer          |null : false                     |
|city                       |string           |null : false                     |
|street_address             |string           |null : false                     |
|building                   |string           |                                 |
|phone                      |string           |null : false                     |
|purchase                   |references       |null : false , foreign_key: true |
### Association
- belongs_to : purchases