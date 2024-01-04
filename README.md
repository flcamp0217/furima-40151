# テーブル設計

##users テーブル
|Column                     |Type             |Options                          |
|---------------------------|-----------------|---------------------------------|
|nickname                   |string           |null : false                     |
|username                   |text             |null : false                     |
|birthday                   |text             |null : false                     |
### Association
- has_many : item
- has_many : purchase
- belongs_to : shipping_info

##Items テーブル
|Column                     |Type             |Options                          |
|---------------------------|-----------------|---------------------------------|
|item_name                  |string           |null : false                     |
|item_show                  |text             |null : false                     |
|explanation                |string           |null : false                     |
|category                   |string           |null : false                     |
|quality                    |string           |null : false                     |
|postage                    |string           |null : false                     |
|shipping_area              |text             |null : false                     |
|delivery_time              |integer          |null : false                     |
|price                      |integer          |null : false                     |
|user                       |references       |null : false , foreign_key: true |
### Association
- belongs_to : user
- belongs_to : purchase
- belongs_to : shipping_info

##Purchases テーブル
|Column                     |Type             |Options                          |
|---------------------------|-----------------|---------------------------------|
|address                    |text             |null : false                     |
|phone                      |integer          |null :                           |
|quantity                   |integer          |null : false                     |
|purchase_price             |integer          |null : false                     |
|user                       |references       |null : false , foreign_key: true |
|item                       |references       |null : false , foreign_key: true |
### Association
- belongs_to : user
- belongs_to : item
- belongs_to : shipping_info

##Shipping_infos テーブル
|Column                     |Type             |Options                          |
|---------------------------|-----------------|---------------------------------|
|shipping_address           |text             |null : false                     |
|user                       |references       |null : false , foreign_key: true |
|item                       |references       |null : false , foreign_key: true |
|purchase                   |references       |null : false , foreign_key: true |
### Association
- has_many : item
- has_many : purchase
- belongs_to : user
