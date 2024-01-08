FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    last_name             {'hoge'}
    first_name            {'hoge'}
    last_name_kana        {'hoge'}
    first_name_kana       {'hoge'}
    birth_date            {'hoge'}
  end
end