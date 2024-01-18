class Order
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postcode, :shipping_area_id, :city, :street_address, :building, :phone

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone, length: { in: 10..11 }, format: { with: /\A\d+\z/, message: 'is invalid' }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id:user_id, item_id:item_id)

    ShippingInfo.create(postcode: postcode, shipping_area_id: shipping_area_id, city: city, street_address: street_address,
    phone: phone, building: building, purchase_id: purchase.id)
  end
end
