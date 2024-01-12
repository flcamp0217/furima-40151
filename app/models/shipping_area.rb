class ShippingArea < ActiveHash::Base
  self.data = [
    { id: 1, shipping_area: '---' }, { id: 2, shipping_area: '北海道' }, { id: 3, shipping_area: '青森県' },
    { id: 4, shipping_area: '岩手県' }, { id: 5, shipping_area: '宮城県' }, { id: 6, shipping_area: '秋田県' },
    { id: 7, shipping_area: '山形県' }, { id: 8, shipping_area: '福島県' }, { id: 9, shipping_area: '茨城県' },
    { id: 10, shipping_area: '栃木県' }, { id: 11, shipping_area: '群馬県' }, { id: 12, shipping_area: '埼玉県' },
    { id: 13, shipping_area: '千葉県' }, { id: 14, shipping_area: '東京都' }, { id: 15, shipping_area: '神奈川県' },
    { id: 16, shipping_area: '新潟県' }, { id: 17, shipping_area: '富山県' }, { id: 18, shipping_area: '石川県' },
    { id: 19, shipping_area: '福井県' }, { id: 20, shipping_area: '山梨県' }, { id: 21, shipping_area: '長野県' },
    { id: 22, shipping_area: '岐阜県' }, { id: 23, shipping_area: '静岡県' }, { id: 24, shipping_area: '愛知県' },
    { id: 25, shipping_area: '三重県' }, { id: 26, shipping_area: '滋賀県' }, { id: 27, shipping_area: '京都府' },
    { id: 28, shipping_area: '大阪府' }, { id: 29, shipping_area: '兵庫県' }, { id: 30, shipping_area: '奈良県' },
    { id: 31, shipping_area: '和歌山県' }, { id: 32, shipping_area: '鳥取県' }, { id: 33, shipping_area: '島根県' },
    { id: 34, shipping_area: '岡山県' }, { id: 35, shipping_area: '広島県' }, { id: 36, shipping_area: '山口県' },
    { id: 37, shipping_area: '徳島県' }, { id: 38, shipping_area: '香川県' }, { id: 39, shipping_area: '愛媛県' },
    { id: 40, shipping_area: '高知県' }, { id: 41, shipping_area: '福岡県' }, { id: 42, shipping_area: '佐賀県' },
    { id: 43, shipping_area: '長崎県' }, { id: 44, shipping_area: '熊本県' }, { id: 45, shipping_area: '大分県' },
    { id: 46, shipping_area: '宮崎県' }, { id: 47, shipping_area: '鹿児島県' }, { id: 48, shipping_area: '沖縄県' }
  ]
  include ActiveHash::Associations
  has_many :items
end
