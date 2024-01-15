FactoryBot.define do
  factory :order do
    postcode { '123-4567' }
    shipping_area_id { 2 }
    city { '東京都' }
    street_address { '1-1' }
    building { '東京ハイツ' }
    phone { '08055443322' }
  end
end
