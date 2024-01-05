# テーブル設計

##users テーブル
|Column                     |Type             |Options                          |
|---------------------------|-----------------|---------------------------------|
|nickname                   |string           |null : false                     |
|email                      |string           |null : false , unique : true     |
|password                   |string           |null : false                     |
|kanji_name                 |string           |null : false                     |
|kana_name                  |string           |null : false                     |
|date                       |string           |null : false                     |
### Association
- has_many : items
- has_many : purchases
- belongs_to : shipping_info

##Items テーブル
|Column                     |Type             |Options                          |
|---------------------------|-----------------|---------------------------------|
|item_name                  |string           |null : false                     |
|item_show                  |text             |null : false                     |
|category_id                |string           |null : false                     |
|quality_id                 |string           |null : false                     |
|postage_id                 |string           |null : false                     |
|shipping_area_id           |string           |null : false                     |
|delivery_time_id           |string           |null : false                     |
|price                      |integer          |null : false                     |
|user                       |references       |null : false , foreign_key: true |
### Association
- belongs_to : user
- belongs_to : purchase
- belongs_to : shipping_info

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
|area                       |integer          |null : false                     |
|city                       |integer          |null : false                     |
|street_address             |integer          |null : false                     |
|building                   |integer          |                                 |
|phone                      |integer          |null : false                     |
|purchases                  |references       |null : false , foreign_key: true |
### Association
- has_many : items
- has_many : purchases
- belongs_to : user