FactoryBot.define do
  factory :item do
    association :user
    product_name { Faker::Alphanumeric.alphanumeric(number: 30) }
    explanation { Faker::Alphanumeric.alphanumeric(number: 1000) }
    category_id { 2 }
    state_id { 2 }
    fee_id { 2 }
    prefecture_id { 2 }
    day_id { 2 }
    price {Faker::Number.number(digits: 7) }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
