class PurchasesShipping
  include ActiveModel::Model
  attr_accessor :postcode, :shipping_area_id, :city, :street_address, :building, :phone, :user_id
end