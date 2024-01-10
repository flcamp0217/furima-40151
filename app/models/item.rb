class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :postage
  belongs_to :shipping_area
  belongs_to :delivery_time

  validates :image, :item_name, :item_show, :category, :quality, :postage, :shipping_area, :delivery_time, :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id, :quality_id, :postage_id, :shipping_area_id, :delivery_time_id, numericality: { other_than: 1 }
end