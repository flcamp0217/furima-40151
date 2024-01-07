class User < ApplicationRecord
  validates :nickname, presence: true
  validates :birth_day, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    # 半角英数字混合での入力のみ許可する
    validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z0-9]+\z/, message: "is invalid. Input half-width alphanumeric characters." }
    # ひらがな、カタカナ、漢字のみ許可する
    validates :kanji_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    # カタカナのみ許可する
    validates :kana_name, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
  end
end
