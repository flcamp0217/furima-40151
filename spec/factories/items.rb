FactoryBot.define do
  factory :item do
    association :user
    image { Rack::Test::UploadedFile.new(Rails.root.join('image', 'design.jpg')) }
    item_name              { 'かえる' }
    item_show              { '美味しそうです' }
    category_id               { 2 }
    quality_id                { 2 }
    postage_id                { 2 }
    shipping_area_id          { 2 }
    delivery_time_id          { 2 }
    price { 3000 }
  end
end
