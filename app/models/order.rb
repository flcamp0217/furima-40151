class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :shipping_area_id, :city, :street_address, :building, :phone

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone, format: { with: /\A\d+\z/, message: 'is invalid' }
  end
  validates :city, :street_address, :building, numericality: { only_integer: false }
end

def save
  purchase = Purchase.create(user_id:, item_id:)

  shipping_info.create(postcode:, shipping_area_id:, city:, street_address:,
                       phone:, building:, purchase_id: purchase.id)
end
