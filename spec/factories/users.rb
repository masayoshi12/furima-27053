FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '久保' }
    last_name_kana { 'クボ' }
    first_name { '雅義' }
    first_name_kana { 'マサヨシ' }
    birthday { '1986-12-22' }
  end
end
