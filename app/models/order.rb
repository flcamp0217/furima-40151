class Order
  include ActiveModel::Model
  attr_accessor :user, :item, :postcode, :shipping_area_id, :city, :street_address, :building, :phone, :user_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city, {only_integer: true}
    validates :street_address, {only_integer: true}
    validates :phone, format: {with: /\A\d+\z/, message: 'is invalid'}
  end
  validates :building, numericality: {only_integer: true}
end

def save

  purchase = Purchase.create(user: user_id, item: item_id)

  shipping_info.create(postcode: postcode, shipping_area_id: shipping_area_id, city: city, street_address: street_address, phone: phone, building: building, purchase_id: purchase.id)
end