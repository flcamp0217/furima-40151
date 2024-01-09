FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) + '117' }
    password_confirmation { password }
    last_name             { '鮭' }
    first_name            { '二郎' }
    last_name_kana        { 'シャケ' }
    first_name_kana       { 'ジロウ' }
    birth_date            { Faker::Date.birthday(min_age: 18, max_age: 65).strftime('%Y-%m-%d') }
  end
end
