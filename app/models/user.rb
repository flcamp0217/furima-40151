class User < ApplicationRecord
  validates :nickname, presence: true
  validates :kanji_name, presence: true
  validates :kana_name, presence: true
  validates :birth_day, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
# 半角英数字混合での入力が必須であることの実装
  validate :password_complexity

  def password_complexity
   return if password.blank? || password =~ /^(?=.*?[A-Za-z])(?=.*?[0-9]).{6,}$/m
   errors.add :password, "は半角英数字の組み合わせで、最低6文字以上で入力してください"
  end
end
