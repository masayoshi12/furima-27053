FactoryBot.define do
  factory :buyer_address do
    postal_code { '100-0000' }
    prefecture_id { 2 }
    municipalities { '大田区' }
    house_number { '大森北０−０−０' }
    phone_number { Faker::Number.number(digits: 11) }
  end
end